# pylint: skip-file
from qutebrowser.config.config import ConfigContainer


def apply(c: ConfigContainer):
    c.content.javascript.alert = True
    c.content.javascript.can_access_clipboard = False
    c.content.javascript.can_open_tabs_automatically = False
    c.content.javascript.enabled = True
    c.content.javascript.modal_dialog = False
    c.content.javascript.prompt = True
