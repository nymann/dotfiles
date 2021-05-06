# pylint: skip-file
from qutebrowser.config.config import ConfigContainer


def apply(c: ConfigContainer):
    c.aliases["proxy-tor-on"] = "set content.proxy socks://localhost:9050/"
    c.aliases["proxy-off"] = "set content.proxy none"
    c.aliases["proxy-zscaler-on"] = "set content.proxy socks://localhost:8021/"
