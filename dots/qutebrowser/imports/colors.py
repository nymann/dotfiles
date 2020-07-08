# -*- coding: utf-8 -*-
"""Example Google style docstrings.

"""
# Solarized dark
# base00 = "#002b36"
# base01 = "#073642"
# base02 = "#586e75"
# base03 = "#657b83"
# base04 = "#839496"
# base05 = "#93a1a1"
# base06 = "#eee8d5"
# base07 = "#fdf6e3"
# base08 = "#dc322f"
# base09 = "#cb4b16"
# base0A = "#b58900"
# base0B = "#859900"
# base0C = "#2aa198"
# base0D = "#268bd2"
# base0E = "#6c71c4"
# base0F = "#d33682"

# Onedark
base00 = "#282c34"
base01 = "#353b45"
base02 = "#3e4451"
base03 = "#545862"
base04 = "#565c64"
base05 = "#abb2bf"
base06 = "#b6bdca"
base07 = "#c8ccd4"
base08 = "#e06c75"
base09 = "#d19a66"
base0A = "#e5c07b"
base0B = "#98c379"
base0C = "#56b6c2"
base0D = "#61afef"
base0E = "#c678dd"
base0F = "#be5046"


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
    # Foreground color for prompts.
    prompts.fg = base05

    # Border used around UI elements in prompts.
    prompts.border = base00

    # Background color for prompts.
    prompts.bg = base00

    # Background color for the selected item in filename prompts.
    prompts.selected.bg = base0A


def _messages(messages):

    # Foreground color of an error message.
    messages.error.fg = base00

    # Background color of an error message.
    messages.error.bg = base08

    # Border color of an error message.
    messages.error.border = base08

    # Foreground color of a warning message.
    messages.warning.fg = base00

    # Background color of a warning message.
    messages.warning.bg = base0E

    # Border color of a warning message.
    messages.warning.border = base0E

    # Foreground color of an info message.
    messages.info.fg = base05

    # Background color of an info message.
    messages.info.bg = base00

    # Border color of an info message.
    messages.info.border = base00


def _downloads(downloads):
    # Background color for the download bar.
    downloads.bar.bg = base00

    # Color gradient start for download text.
    downloads.start.fg = base00

    # Color gradient start for download backgrounds.
    downloads.start.bg = base0D

    # Color gradient end for download text.
    downloads.stop.fg = base00

    # Color gradient stop for download backgrounds.
    downloads.stop.bg = base0C

    # Foreground color for downloads with errors.
    downloads.error.fg = base08


def _keyhints(keyhint):
    # Text color for the keyhint widget.
    keyhint.fg = base05

    # Highlight color for keys to complete the current keychain.
    keyhint.suffix.fg = base05

    # Background color of the keyhint widget.
    keyhint.bg = base00


def _hints(hints):

    # Font color for hints.
    hints.fg = base00

    # Background color for hints. Note that you can use a `rgba(...)` value
    # for transparency.
    hints.bg = base0A

    # Font color for the matched part of hints.
    hints.match.fg = base05


def _completion(completion):
    completion.fg = base05

    # Background color of the completion widget for odd rows.
    completion.odd.bg = base03

    # Background color of the completion widget for even rows.
    completion.even.bg = base00

    # Foreground color of completion widget category headers.
    completion.category.fg = base0A

    # Background color of the completion widget category headers.
    completion.category.bg = base00

    # Top border color of the completion widget category headers.
    completion.category.border.top = base00

    # Bottom border color of the completion widget category headers.
    completion.category.border.bottom = base00

    # Foreground color of the selected completion item.
    completion.item.selected.fg = base01

    # Background color of the selected completion item.
    completion.item.selected.bg = base0A

    # Top border color of the selected completion item.
    completion.item.selected.border.top = base0A

    # Bottom border color of the selected completion item.
    completion.item.selected.border.bottom = base0A

    # Foreground color of the matched text in the selected completion item.
    completion.item.selected.match.fg = base08

    # Foreground color of the matched text in the completion.
    completion.match.fg = base0B

    # Color of the scrollbar handle in the completion view.
    completion.scrollbar.fg = base05

    # Color of the scrollbar in the completion view.
    completion.scrollbar.bg = base00


def _tabs(tabs):
    # Background color of the tab bar.
    tabs.bar.bg = base00

    # Color gradient start for the tab indicator.
    tabs.indicator.start = base0D

    # Color gradient end for the tab indicator.
    tabs.indicator.stop = base0C

    # Color for the tab indicator on errors.
    tabs.indicator.error = base08

    # Foreground color of unselected odd tabs.
    tabs.odd.fg = base05

    # Background color of unselected odd tabs.
    tabs.odd.bg = base03

    # Foreground color of unselected even tabs.
    tabs.even.fg = base05

    # Background color of unselected even tabs.
    tabs.even.bg = base00

    # Background color of pinned unselected even tabs.
    tabs.pinned.even.bg = base0C

    # Foreground color of pinned unselected even tabs.
    tabs.pinned.even.fg = base07

    # Background color of pinned unselected odd tabs.
    tabs.pinned.odd.bg = base0B

    # Foreground color of pinned unselected odd tabs.
    tabs.pinned.odd.fg = base07

    # Background color of pinned selected even tabs.
    tabs.pinned.selected.even.bg = base05

    # Foreground color of pinned selected even tabs.
    tabs.pinned.selected.even.fg = base00

    # Background color of pinned selected odd tabs.
    tabs.pinned.selected.odd.bg = base05

    # Foreground color of pinned selected odd tabs.
    tabs.pinned.selected.odd.fg = base0E

    # Foreground color of selected odd tabs.
    tabs.selected.odd.fg = base00

    # Background color of selected odd tabs.
    tabs.selected.odd.bg = base05

    # Foreground color of selected even tabs.
    tabs.selected.even.fg = base00

    # Background color of selected even tabs.
    tabs.selected.even.bg = base05


def _contextmenu(contextmenu):
    # Background color of the context menu. If set to null, the Qt default is used.
    contextmenu.menu.bg = base00

    # Foreground color of the context menu. If set to null, the Qt default is used.
    contextmenu.menu.fg = base05

    # Background color of the context menu’s selected item. If set to null, the Qt default is used.
    contextmenu.selected.bg = base0A

    #Foreground color of the context menu’s selected item. If set to null, the Qt default is used.
    contextmenu.selected.fg = base01


def _statusbar(statusbar):
    # Foreground color of the statusbar.
    statusbar.normal.fg = base0B

    # Background color of the statusbar.
    statusbar.normal.bg = base00

    # Foreground color of the statusbar in insert mode.
    statusbar.insert.fg = base00

    # Background color of the statusbar in insert mode.
    statusbar.insert.bg = base0D

    # Foreground color of the statusbar in passthrough mode.
    statusbar.passthrough.fg = base00

    # Background color of the statusbar in passthrough mode.
    statusbar.passthrough.bg = base0C

    # Foreground color of the statusbar in private browsing mode.
    statusbar.private.fg = base00

    # Background color of the statusbar in private browsing mode.
    statusbar.private.bg = base03

    # Foreground color of the statusbar in command mode.
    statusbar.command.fg = base05

    # Background color of the statusbar in command mode.
    statusbar.command.bg = base00

    # Foreground color of the statusbar in private browsing + command mode.
    statusbar.command.private.fg = base05

    # Background color of the statusbar in private browsing + command mode.
    statusbar.command.private.bg = base00

    # Foreground color of the statusbar in caret mode.
    statusbar.caret.fg = base00

    # Background color of the statusbar in caret mode.
    statusbar.caret.bg = base0E

    # Foreground color of the statusbar in caret mode with a selection.
    statusbar.caret.selection.fg = base00

    # Background color of the statusbar in caret mode with a selection.
    statusbar.caret.selection.bg = base0D

    # Background color of the progress bar.
    statusbar.progress.bg = base0D

    # Default foreground color of the URL in the statusbar.
    statusbar.url.fg = base05

    # Foreground color of the URL in the statusbar on error.
    statusbar.url.error.fg = base08

    # Foreground color of the URL in the statusbar for hovered links.
    statusbar.url.hover.fg = base05

    # Foreground color of the URL in the statusbar on successful load
    # (http).
    statusbar.url.success.http.fg = base0C

    # Foreground color of the URL in the statusbar on successful load
    # (https).
    statusbar.url.success.https.fg = base0B

    # Foreground color of the URL in the statusbar when there's a warning.
    statusbar.url.warn.fg = base0E
