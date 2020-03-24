#!/usr/bin/python3
# vim: ts=4:et:sw=4

# Copyright Gernot Hillier, Siemens AG, 2018 <gernot.hillier@siemens.com>
# Licensed under the Siemens Inner Source License 1.2 or at your option any
# later version

import sys
import os
import subprocess
import argparse
import signal
import pyroute2
import time
import textwrap


class RoutingMonitor:
    def __init__(self):
        self.interfaces = {}
        self.tunnel_start = None
        self.ipr = pyroute2.IPRoute()

    def activate(self):
        self.ipr.bind()

    def check_rtnetlink_broadcast(self):
        """Wait for next rtnetlink broadcast, parse it and return False
        if a policy violation was detected."""
        for msg in self.ipr.get():
            if msg["event"] == "RTM_NEWADDR":
                addr = msg.get_attr("IFA_ADDRESS")
                name = msg.get_attr("IFA_LABEL")
                if_index = msg["index"]
                print("new address %s assigned for interface %s(%i)" %
                      (addr, name, if_index))
                if if_index not in self.interfaces.keys():
                    self.interfaces[if_index] = {'addr': [addr, ]}
                elif addr not in self.interfaces[if_index]["addr"]:
                    self.interfaces[if_index]["addr"].append(addr)
                # IFA_LABEL not set for IPv6
                if name:
                    self.interfaces[if_index]["name"] = name
            # TODO: forget ip addresses for RTM_DELADDR
            elif msg["event"] in ("RTM_NEWROUTE", "RTM_DELROUTE"):
                if msg["dst_len"] == 0:
                    dst = "DEFAULT"
                else:
                    dst = msg.get_attr("RTA_DST")
                gateway = msg.get_attr("RTA_GATEWAY")
                if_index = msg.get_attr("RTA_OIF")
                if (if_index in self.interfaces.keys()) and \
                        ("name" in self.interfaces[if_index].keys()):
                    interface = self.interfaces[if_index]["name"]
                else:
                    interface = "unknown interface %i" % if_index

                if (dst == "DEFAULT" and msg["event"] == "RTM_NEWROUTE" and
                        interface.startswith("tun")):
                    print("DEFAULT route set for %s - Tunnel established" %
                          interface)
                    self.tunnel_start = int(time.time())
                    continue

                # grace period of 10 s until async route setting completed
                # TODO: instead, we should check routing events against
                # advertised routes from PulseSecure, see
                # https://code.siemens.com/linux/urav2-openconnect/issues/2
                if (self.tunnel_start and
                        time.time() > (self.tunnel_start + 10)):
                    if (if_index in self.interfaces.keys() and
                            dst in self.interfaces[if_index]["addr"]):
                        print("ignoring", msg["event"],
                              "for own address of dev", interface)
                    else:
                        # TODO: perhaps we could ignore IPv4 private
                        # addresses and IPv6 ULAs?
                        print("ALERT!", msg["event"], "to", dst,
                              "via", gateway, "dev", interface)
                        return False
        return True


def check_machine_cert(cert, key, ca_chain):
    ret = subprocess.call([
        "openssl", "verify", "-CAfile", ca_chain, cert
    ])
    if ret != 0:
        return False
    mod1 = subprocess.check_output([
        "openssl", "x509", "-in", cert, "-noout", "-modulus"
    ])
    mod2 = subprocess.check_output([
        "openssl", "rsa", "-in", key, "-noout", "-modulus"
    ])
    if mod1 != mod2:
        print("ERROR: machine certificate and key don't match.")
        return False
    return True


def cmdline_args():
    parser = argparse.ArgumentParser(
        description=textwrap.dedent("""\
        Connect to URAv2. This script needs root rights for tunnel setup."""),
        formatter_class=argparse.RawTextHelpFormatter
    )
    parser.add_argument(
        "-u", "--user",
        help="Non-privileged user for web authentication."
    )
    parser.add_argument(
        "--url",
        help="URAv2 URL to connect to, default: %(default)s",
        default="https://ura.siemens.com/linux"
    )
    parser.add_argument(
        "--openconnect",
        metavar="\"<openconnect> <args...>\"",
        help=textwrap.dedent("""\
        OpenConnect cmdline (needs to contain --cookie-on-stdin!).
        Default: openconnect --juniper %%URL%% --cookie-on-stdin --no-dtls""")
    )
    pwd = os.path.dirname(os.path.realpath(sys.argv[0]))
    parser.add_argument(
        "--auth",
        metavar="\"<auth-script> <args...>\"",
        help=textwrap.dedent("""\
        Auth script to call. We expect a line "DSID=xxx" as result on
        its stdout.
        Default: %(default)s"""),
        default=pwd + "/ura-v2-auth.py -u %URL% %PKCS11%"
    )
    parser.add_argument(
        "--ca-chain-file",
        help=textwrap.dedent("""\
        File with all needed CA certificates to verify machine certificate.
        For Siemens Debian uDWP, the default should work. For an OpenSUSE uDWP,
        it should be in /usr/share/pki/trust/anchors/CA_siemens.crt.
        Default: %(default)s"""),
        default="/usr/local/share/ca-certificates/CA_siemens.crt"
    )
    parser.add_argument(
        "--reconnect",
        action="store_true",
        help="Try to reconnect after disconnect with existing auth cookie."
    )
    parser.add_argument(
        "pkcs11_url",
        help=textwrap.dedent("""\
        PKCS11 URL for Auth certificate on your smartcard. You can use the
        special value "auto-detect", see "ura-v2-auth.py -h" for details.
        Example: %(prog)s 'pkcs11:manufacturer=Siemens...;id=%%a8...' ...
        """)
    )
    parser.add_argument(
        "--gnutls-cli",
        help="Path to the gnutcls-cli binary",
        default="/usr/bin/gnutls-cli"
    )
    parser.add_argument(
        "machine_cert",
        help="path to machine certificate identifying a Siemens client"
    )
    parser.add_argument(
        "machine_key",
        help="path to private key of machine certificate"
    )
    return parser.parse_args()


args = cmdline_args()
if args.openconnect:
    openconnect_cmd = args.openconnect.replace("%URL%", args.url).split()
else:
    openconnect_cmd = ["openconnect", "--juniper", args.url,
                       "--cookie-on-stdin", "--no-dtls"]

auth_cmd = (args.auth.replace("%URL%", args.url)
            .replace("%PKCS11%", args.pkcs11_url))
auth_cmd = auth_cmd.split()

if args.gnutls_cli:
    auth_cmd = auth_cmd + ["--gnutls-cli", args.gnutls_cli]

if args.user:
    auth_cmd = ["sudo", "-u", args.user] + auth_cmd
else:
    print("WARNING: Please provide \"-u\" to run auth step as non-root!")

if os.getuid() != 0:
    sys.stderr.write("ERROR: We need root rights for tunnel setup\n")
    sys.exit(1)

print("Executing machine certificate check")
if not check_machine_cert(args.machine_cert, args.machine_key,
                          args.ca_chain_file):
    print("ERROR: Machine certificate validation failed.")
    sys.exit(1)

print("Executing auth cmd:", " ".join(auth_cmd))
p = subprocess.Popen(auth_cmd, stdout=subprocess.PIPE, universal_newlines=True)
while p.poll() is None:
    line = p.stdout.readline()
    if line.startswith("DSID="):
        print("Received DSID from auth script.")
        dsid = line
    else:
        print(line, end="")
if p.poll() != 0:
    print("Error during auth-script call", p.poll())
    sys.exit(1)

while True:
    openconnect_killed = False
    mon = RoutingMonitor()
    mon.activate()

    print("Executing OpenConnect:", " ".join(openconnect_cmd))
    p = subprocess.Popen(openconnect_cmd, stdin=subprocess.PIPE,
                         universal_newlines=True)
    if p.poll() is None:
        print("Sending DSID")
        p.stdin.write(dsid)
        p.stdin.flush()

    while p.poll() is None:
        try:
            if not openconnect_killed and not mon.check_rtnetlink_broadcast():
                print("Aborting Connection")
                p.send_signal(signal.SIGHUP)
                openconnect_killed = True
            else:
                time.sleep(0.001)  # wait for OpenConnect shutdown
                # TODO: Check whether OpenConnect really finished.
                # Why is this sleep called in normal operation?
        except KeyboardInterrupt:
            print("KeyboardInterrupt received, waiting for OpenConnect "
                  "shutdown.")
            p.send_signal(signal.SIGINT)
            openconnect_killed = True

    if p.poll() != 0:
        print("OpenConnect exited with error", p.poll())
        sys.exit(1)
    else:
        print("OpenConnect exited normally")
        sys.exit(0)

    if not args.reconnect:
        break
