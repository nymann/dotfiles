# pylint: skip-file
from qutebrowser.config.configfiles import ConfigAPI

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


def apply(config: ConfigAPI):
    config.set("content.notifications.enabled", "ask")

    for host in allowed:
        config.set("content.notifications.enabled", True, "*://%s" % host)
        config.set("content.notifications.enabled", True, "*://*.%s" % host)

    for host in blocked:
        config.set("content.notifications.enabled", False, "*://%s" % host)
        config.set("content.notifications.enabled", False, "*://*.%s" % host)
