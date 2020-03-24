#!/usr/bin/python3
# vim: ts=4:et:sw=4

# Copyright Gernot Hillier, Siemens AG, 2018 <gernot.hillier@siemens.com>
# Licensed under the Siemens Inner Source License 1.2 or at your option any
# later version

import sys
import os
import re
import time
import requests
import subprocess
import textwrap
import argparse
from bs4 import BeautifulSoup
from urllib.parse import urlparse
from http.cookies import SimpleCookie

if os.getuid() == 0:
    print("WARNING: This script doesn't need root rights!")


def smartcard_request(req, session, pkcs11_url, gnutls_cli):
    # ugly workaround #1: use gnutls-cli for HTTPS smartcard auth as requests
    # lib doesn't support smartcard (neither gnutls nor OpenSSL engines).
    # Alternatives:
    # - extend PyOpenSSL to support OpenSSL engines and use it in custom
    #   SSLContext in python-requests' HTTPAdapter. I did basic
    #   OpenSSL+engine_pkcs11 tests  with my ID card, but this requires changes
    #   to global OpenSSL config, see
    #   https://wiki.siemens.com/display/en/How-To+Siemens+PKI2+under+Linux
    # - use python-gnutls either manually or as a TransportAdapter for python-
    #   requests, but python-gnutls is not included in all major distros
    # - curl compiled against GNUtls should do complete SmartCard plus
    #   HTTP handling for us (untested), but many users would need to
    #   compile it manually because most distros only provide OpenSSL variant
    host = urlparse(req.url).hostname
    req_str = ["%s %s HTTP/1.1\n" % (req.method, req.path_url),
               "Host: %s\n" % host]
    for h in req.headers:
        req_str.append("%s: %s\n" % (h, req.headers[h]))
    req_str.append("\n")
    for l in req.body.split("\n"):
        req_str.append(l+"\n")

    # universal_newlines converts crlf from server to lf for us.
    # --crlf converts lf from us to crlf for the server, otherwise we get
    # "400 Bad Request"
    p = subprocess.Popen(
        [gnutls_cli, "--crlf",
         "--x509keyfile", pkcs11_url+';object-type=private',
         "--x509certfile", pkcs11_url+';object-type=cert',
         host],
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE,
        bufsize=1,
        universal_newlines=True
    )
    resp = requests.models.Response()
    resp.url = req.url
    resp._content = bytes()

    STATE_TLS_SETUP = 0
    STATE_CONNECT = 1
    STATE_HEADER = 2
    STATE_CONTENT = 3
    resp_state = 0
    chunked = False
    chunk_marker = False
    last_line = ""
    resp_cookies = SimpleCookie()
    while p.poll() is None:
        line = p.stdout.readline()[:-1]
        if resp_state == STATE_TLS_SETUP:
            if line.startswith("- Simple Client Mode"):
                resp_state = STATE_CONNECT
                print("Sending request to gnutls-cli")
                for r in req_str:
                    # sys.stdout.write(r)
                    p.stdin.write(r)
                    # force to send line by line, neither bufsize=1 nor
                    # flush() helps
                    time.sleep(0.01)
        elif resp_state == STATE_CONNECT:
            if line.startswith("HTTP"):
                resp.status_code = int(line.split()[1])
                resp_state = STATE_HEADER
                print(line)
        elif resp_state == STATE_HEADER:
            # print("Header rcvd:", line)
            if line.startswith("Transfer-Encoding: chunked"):
                chunked = True
            elif line.startswith("Set-Cookie: "):
                resp_cookies.load(line[12:].strip())
            elif line == "":
                resp_state = STATE_CONTENT
        elif resp_state == STATE_CONTENT:
            # dirty workaround 2: remove lines looking like HTTP chunk start
            # lines. Better would be to count bytes, but I didn't get length
            # calculations right with subprocess and \n vs. \r\n
            if chunk_marker:
                last_line += line
                chunk_marker = False
                continue
            if chunked and re.search("^[0-9a-fA-F]+$", line):
                print("Removing chunk marker", line)
                chunk_marker = True
            else:
                resp._content += (last_line.encode())
                last_line = line
            if line.find("</html>") != -1:
                resp._content += (line.encode()+b"\n")
                last_line = ""
                print("Closing connection")
                p.stdin.close()
    if p.poll() != 0:
        print("Error during gnutls-cli call", p.poll())
        sys.exit(1)
    for cookie in resp_cookies:
        # max-age copying triggers error, so just ignore it...
        print("Passing cookie", cookie)
        resp_cookies[cookie]["max-age"] = ""
        session.cookies[cookie] = resp_cookies[cookie]
    return resp


parser = argparse.ArgumentParser(
    description="Connect to URAv2 gateway for Linux and authenticate "
    "via smartcard and Entitlement.",
    formatter_class=argparse.RawTextHelpFormatter)
parser.add_argument(
    "pkcs11_url",
    help=textwrap.dedent("""\
    PKCS11 URL for Auth certificate on your smartcard. If you specify
    "auto-detect", this script will try to find your Siemens ID card and the
    Auth certificate on it. This takes several seconds, but it will tell you
    the result, so you can specify it for further starts.""")
)

parser.add_argument("-u", "--url",
                    help="URAv2 URL to connect to, default: %(default)s",
                    default="https://ura.siemens.com/linux")
parser.add_argument("-g", "--gnutls-cli",
                    help="Path to gnutls-cli binary",
                    default="/usr/bin/gnutls-cli")

args = parser.parse_args()

if args.pkcs11_url == "auto-detect":
    print("PKCS11 URL not given. Searching certificate, please wait...")
    token = subprocess.check_output(["p11tool", "--list-tokens"],
                                    universal_newlines=True)
    token = [t for t in token.split("\n")
             if "URL:" in t and "Siemens%20Corporate%20ID%20Card" in t]
    if len(token) != 1:
        print("ERROR: Couldn't find Siemens ID card.")
        sys.exit(1)

    token = token[0].split("URL:")[1].strip()
    certs = subprocess.check_output(["p11tool", "--list-all-certs", token],
                                    universal_newlines=True)
    for cert in certs.split("\n"):
        if "URL:" not in cert:
            continue
        cert = cert.strip().split("pkcs11:")[1].split(";")
        # for some reason, gnutls-cli needs at least two attributes while
        # p11tool works when only specifying "id=..."
        cert = [t for t in cert if "id=" in t or "token=" in t]
        cert = "pkcs11:" + ";".join(cert)
        r = subprocess.call(
            """p11tool --export '%s;object-type=cert' |
               openssl x509 -noout -text |
               grep -q 'TLS Web Client Authentication'""" % cert,
            shell=True
        )
        if r == 0:
            print("Found Auth cert.")
            print("To speed up subsequent calls, provide this PKCS11 URL:")
            print(cert)
            args.pkcs11_url = cert
            break

if not args.pkcs11_url.startswith("pkcs11:"):
    print("Invalid PKCS11 URL")
    sys.exit(1)
# remove object-type from PKCS#11 URL
pkcs11_url = args.pkcs11_url.split(";")
pkcs11_url = ";".join(filter(lambda a: not a.startswith("object-type"),
                             pkcs11_url))

session = requests.Session()
data = {}
url = args.url
session.headers = {
        'User-Agent': 'DSClient; PulseLinux',
        }
session.cookies.set('DSSigninNotif', '1')
method = "get"
for form_name in ("login_PKI", "MessageAccept", "gaform", "notificationForm"):
    print()
    print("--- Loading", url)
    if form_name == "MessageAccept":
        method = "prep_"+method

    if method == "get":
        resp = session.get(url)
    elif method == "post":
        resp = session.post(url, data=data)
    elif method == "prep_post":
        req = requests.Request("POST", url, data=data)
        req = session.prepare_request(req)
        resp = smartcard_request(req, session, pkcs11_url, args.gnutls_cli)
    else:
        print("ERROR: Unknown form method", method)

    for r in resp.history:
        print("Retrieved", r.url, r)
    print("Retrieved", resp.url, resp)
    resp_soup = BeautifulSoup(resp.text, 'html.parser')

    errors = resp_soup.find_all(class_="ErrorMessage")
    if len(errors) > 0:
        print("Received error:", errors[0].text)
        sys.exit(1)

    if "DSID" in session.cookies.keys():
        print("Got DSID!")
        break

    print("Handling form", form_name)

    form = resp_soup.find_all("form", attrs={"name": form_name})
    if len(form) != 1:
        print("ERROR: Couldn't find form", form_name)
        print()
        print("We received:")
        print(resp.text)
        sys.exit(1)
    form = form[0]
    for fields in form.find_all("input"):
        f_type = fields.get("type")
        f_name = fields.get("name")
        if f_type == "image":
            # tell it we clicked an arbitrary position in image
            data[f_name+".x"] = 5
            data[f_name+".y"] = 5
        elif f_type == "hidden":
            data[f_name] = fields.get("value")
        else:
            print("WARNING: Ignoring field", f_name,
                  "with type we can't handle:", f_type)

    method = form.get("method")
    new_url = form.get("action")
    if new_url[0] == "/":
        old = urlparse(url)
        url = old.scheme+"://"+old.netloc+new_url
    else:
        url = new_url
    print("next url:", url)

print("DSID=%s" % session.cookies["DSID"])
