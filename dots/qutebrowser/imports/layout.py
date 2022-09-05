# pylint: skip-file
from qutebrowser.config.config import ConfigContainer


def apply(c: ConfigContainer):
    c.statusbar.padding = {"top": 1, "bottom": 1, "left": 5, "right": 5}
    c.tabs.max_width = -1
    c.tabs.min_width = -1
    c.tabs.indicator.width = 0
    c.tabs.position = "top"
