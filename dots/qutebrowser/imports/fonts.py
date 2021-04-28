# pylint: skip-file
from qutebrowser.config.config import ConfigContainer

font_family = "Fira Code Mono"


def apply(c: ConfigContainer):
    c.fonts.default_family = font_family
    c.fonts.default_size = "14px"
    c.fonts.web.family.standard = font_family
    c.fonts.web.size.default = 16
