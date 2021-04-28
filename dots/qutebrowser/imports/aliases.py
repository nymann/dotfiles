# pylint: skip-file
from qutebrowser.config.config import ConfigContainer


def apply(c: ConfigContainer):
    c.aliases["tor-on"] = "set content.proxy socks://localhost:9050/"
    c.aliases["tor-off"] = "set content.proxy none"
