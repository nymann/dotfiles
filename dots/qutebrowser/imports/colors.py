# pylint: skip-file
c_bg = "#282828"
c_fg = "#dbdbb2"
c_bg_hl = "#504945"
c_fg_hl = "#fbf1c7"
c_bg_red = "#cc241d"
c_fg_red = "#fb4934"
c_bg_green = "#98971a"
c_fg_green = "#b8bb26"
c_bg_yellow = "#d79921"
c_fg_yellow = "#fabd2f"
c_bg_blue = "#458588"
c_fg_blue = "#83a598"
c_bg_purple = "#b16286"
c_fg_purple = "#d3869b"
c_bg_aqua = "#689d6a"
c_fg_aqua = "#8ec07c"
c_bg_orange = "#d65d03"
c_fg_orange = "#fe8019"

def apply(c):
    c.colors.completion.fg = c_fg
    c.colors.completion.category.bg = c_bg_orange
    c.colors.completion.category.fg = c_fg
    c.colors.completion.category.border.bottom = c_bg_orange
    c.colors.completion.category.border.top = c_bg_orange
    c.colors.completion.even.bg = c_bg
    c.colors.completion.odd.bg = c_bg_hl
    c.colors.completion.item.selected.bg = c_bg_green
    c.colors.completion.item.selected.fg = c_fg
    c.colors.completion.item.selected.border.bottom = c_bg_green
    c.colors.completion.item.selected.border.top = c_bg_green
    c.colors.completion.item.selected.match.fg = c_fg_red
    c.colors.completion.scrollbar.bg = c_bg
    c.colors.completion.scrollbar.fg = c_fg

    c.colors.contextmenu.menu.bg = c_bg
    c.colors.contextmenu.menu.fg = c_fg
    c.colors.contextmenu.selected.bg = c_bg_hl
    c.colors.contextmenu.selected.fg = c_fg_hl

    c.colors.downloads.bar.bg = c_bg
    c.colors.downloads.error.bg = c_bg
    c.colors.downloads.error.fg = c_fg_red
    c.colors.downloads.start.bg = c_bg
    c.colors.downloads.start.fg = c_fg_blue
    c.colors.downloads.stop.bg = c_bg
    c.colors.downloads.stop.fg = c_fg_yellow

    c.colors.hints.bg = c_bg
    c.colors.hints.fg = c_fg
    c.colors.hints.match.fg = c_bg

    c.colors.messages.error.bg = c_bg
    c.colors.messages.error.fg = c_fg_red
    c.colors.messages.error.border = c_fg_red
    c.colors.messages.info.bg = c_bg
    c.colors.messages.info.fg = c_fg_blue
    c.colors.messages.info.border = c_fg_blue
    c.colors.messages.warning.bg = c_bg
    c.colors.messages.warning.fg = c_fg_yellow
    c.colors.messages.warning.border = c_fg_yellow

    c.colors.prompts.bg = c_bg
    c.colors.prompts.border = c_bg_hl
    c.colors.prompts.fg = c_fg
    c.colors.prompts.selected.bg = c_bg_hl

    c.colors.statusbar.caret.bg = c_bg_purple
    c.colors.statusbar.caret.fg = c_fg_purple
    c.colors.statusbar.caret.selection.bg = c_bg_purple
    c.colors.statusbar.caret.selection.fg = c_fg
    c.colors.statusbar.command.bg = c_bg
    c.colors.statusbar.command.fg = c_fg_blue
    c.colors.statusbar.command.private.bg = c_bg
    c.colors.statusbar.command.private.fg = c_bg_blue
    c.colors.statusbar.insert.bg = c_bg
    c.colors.statusbar.insert.fg = c_fg_aqua
    c.colors.statusbar.url.error.fg = c_fg_red
    c.colors.statusbar.url.fg = c_fg
    c.colors.statusbar.url.hover.fg = c_fg_blue
    c.colors.statusbar.url.success.http.fg = c_fg_yellow
    c.colors.statusbar.url.success.https.fg = c_fg_aqua
    c.colors.statusbar.url.warn.fg = c_fg_yellow

    c.colors.tabs.bar.bg = c_bg
    c.colors.tabs.even.bg = c_bg
    c.colors.tabs.even.fg = c_fg
    c.colors.tabs.indicator.error = c_bg_red
    c.colors.tabs.indicator.start = c_bg_blue
    c.colors.tabs.indicator.stop = c_bg_aqua
    c.colors.tabs.odd.bg = c_bg_hl
    c.colors.tabs.odd.fg = c_fg_hl
    c.colors.tabs.pinned.even.bg = c_bg_yellow
    c.colors.tabs.pinned.even.fg = c_fg
    c.colors.tabs.pinned.odd.bg = c_bg_yellow
    c.colors.tabs.pinned.odd.fg = c_fg
    c.colors.tabs.pinned.selected.even.bg = c_bg_orange
    c.colors.tabs.pinned.selected.even.fg = c_fg
    c.colors.tabs.pinned.selected.odd.bg = c_bg_orange
    c.colors.tabs.pinned.selected.odd.fg = c_fg
    c.colors.tabs.selected.even.bg = c_bg_orange
    c.colors.tabs.selected.even.fg = c_fg
    c.colors.tabs.selected.odd.bg = c_bg_orange
    c.colors.tabs.selected.odd.fg = c_fg

    c.colors.webpage.prefers_color_scheme_dark = True
