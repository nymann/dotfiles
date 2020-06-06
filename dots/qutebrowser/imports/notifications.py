allowed = [
    "mo-gitlab.siemens.dk",
    "teams.microsoft.com",
    "protonmail.com",
    "office365.com",
    "github.com",
    "gitlab.com",
    "circuit.siemens.com",
]

blocked = [
    "reddit.com",
    "youtube.com",
]

def apply(config):
    config.set("content.notifications", "ask")

    for host in allowed:
        config.set("content.notifications", True, "*://%s" % host)
        config.set("content.notifications", True, "*://*.%s" % host)

    for host in blocked:
        config.set("content.notifications", False, "*://%s" % host)
        config.set("content.notifications", False, "*://*.%s" % host)
