# pylint: skip-file
def apply(c):
    c.aliases["tor-on"] = "set content.proxy socks://localhost:9050/"
    c.aliases["tor-off"] = "set content.proxy none"
