# -*- coding: utf-8 -*-
"""Example Google style docstrings.

"""

base000 = "#000000"
base200 = "#323232"
base450 = "#595959"
base600 = "#969696"
base750 = "#BEBEBE"
base800 = "#D2D2D2"
base900 = "#F0F0F0"
base1000 = "#FFFFFF"
primaryDarker = "#354C80"
primaryDark = "#005CBF"
primary = "#006FE6"
primaryLight = "#009EFF"
primaryLighter = "#7FB7F2"
primaryLightest = "#CCE2FA"
infoDark = "#235461"
info = "#006FE6"
infoLight = "#BBD0D7"
infoLighter = "#D1E8F0"
warningDark = "#665E48"
warning = "#FFC800"
warningLight = "#E6DBB7"
warningLighter = "#FFEDB5"
errorDark = "#811211"
error = "#F62447"
errorLight = "#D6B4B4"
errorLighter = "#FCD3D2"
successDark = "#5E6919"
success = "#65C728"
successLight = "#C8D1BA"
successLighter = "#E6EED1"
firefly = "#1E2832"
aquaHaze = "#DCE1E6"
stoneDark = "#3C464B"
stoneLight = "#879BAA"
stoneLight35 = "#BECDD7"
sandDark = "#73645A"
sandLight = "#AAAA96"
sandLight35 = "#D7D7CD"
snow = "#FFFFFF"
accentTealDark = "#00646E"
accentTealLight = "#41AAAA"
accentBlueDark = "#005F87"
accentBlueLight = "#50BED7"
accentYellowDark = "#EB780A"
accentYellowLight = "#FFB900"
accentRedDark = "#641946"
accentRedLight = "#AF235F"
accentGreenDark = "#647D2D"
accentGreenLight = "#AAB414"

bg = snow
fg = base200


def apply(c):
    """apply.

    Args:
        c:
    """
    _tabs(c.colors.tabs)
    _completion(c.colors.completion)
    _prompts(c.colors.prompts)
    _messages(c.colors.messages)
    _downloads(c.colors.downloads)
    _statusbar(c.colors.statusbar)
    _contextmenu(c.colors.contextmenu)
    _hints(c.colors.hints)

    c.colors.webpage.prefers_color_scheme_dark = True


def _prompts(prompts):

    prompts.bg = bg
    prompts.border = warning
    prompts.fg = fg
    prompts.selected.bg = bg


def _messages(messages):

    messages.error.bg = bg
    messages.error.border = warning
    messages.error.fg = fg
    messages.info.bg = bg
    messages.info.border = warning
    messages.info.fg = fg
    messages.warning.bg = bg
    messages.warning.border = warning
    messages.warning.fg = fg


def _downloads(downloads):

    downloads.bar.bg = bg
    downloads.error.bg = bg
    downloads.error.fg = fg
    downloads.start.bg = bg
    downloads.start.fg = fg
    downloads.stop.bg = bg
    downloads.stop.fg = fg


def _hints(hints):

    hints.bg = bg
    hints.fg = fg
    hints.match.fg = fg


def _completion(completion):

    completion.category.bg = bg
    completion.category.border.bottom = warning
    completion.category.border.top = warning
    completion.category.fg = fg
    completion.even.bg = bg
    completion.fg = fg
    completion.item.selected.bg = bg
    completion.item.selected.border.bottom = warning
    completion.item.selected.border.top = warning
    completion.item.selected.fg = fg
    completion.item.selected.match.fg = fg
    completion.odd.bg = bg
    completion.scrollbar.bg = bg
    completion.scrollbar.fg = fg


def _tabs(tabs):

    tabs.bar.bg = bg

    tabs.even.bg = bg
    tabs.even.fg = fg

    tabs.indicator.error = error
    tabs.indicator.start = warning
    tabs.indicator.stop = warning

    tabs.odd.bg = bg
    tabs.odd.fg = fg

    tabs.pinned.even.bg = bg
    tabs.pinned.even.fg = fg
    tabs.pinned.odd.bg = bg
    tabs.pinned.odd.fg = fg
    tabs.pinned.selected.even.bg = bg
    tabs.pinned.selected.even.fg = fg
    tabs.pinned.selected.odd.bg = bg
    tabs.pinned.selected.odd.fg = fg

    tabs.selected.even.bg = bg
    tabs.selected.even.fg = fg
    tabs.selected.odd.bg = bg
    tabs.selected.odd.fg = fg


def _contextmenu(contextmenu):

    contextmenu.menu.bg = bg
    contextmenu.menu.fg = fg
    contextmenu.selected.bg = bg
    contextmenu.selected.fg = fg


def _statusbar(statusbar):
    statusbar.caret.bg = bg
    statusbar.caret.fg = fg
    statusbar.caret.selection.bg = bg
    statusbar.caret.selection.fg = fg

    statusbar.command.bg = bg
    statusbar.command.fg = fg
    statusbar.command.private.bg = bg
    statusbar.command.private.fg = fg

    statusbar.insert.bg = bg
    statusbar.insert.fg = fg

    statusbar.url.error.fg = fg
    statusbar.url.fg = fg
    statusbar.url.hover.fg = fg
    statusbar.url.success.http.fg = fg
    statusbar.url.success.https.fg = fg
    statusbar.url.warn.fg = fg
