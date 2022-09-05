# pylint: skip-file
from imports import (aliases, binds, colors, content, fonts, javascript,
                     layout, notifications, user_agent)
from qutebrowser.config.config import ConfigContainer
from qutebrowser.config.configfiles import ConfigAPI

config: ConfigAPI = config  # noqa: F821 pylint: disable=E0602,C0103
c: ConfigContainer = c  # noqa: F821 pylint: disable=E0602,C0103files

config.load_autoconfig(False)
aliases.apply(c)
colors.apply(c)
javascript.apply(c)
fonts.apply(c)
layout.apply(c)
binds.apply(config)
user_agent.apply(config)
content.apply(config, c)
notifications.apply(config)

c.auto_save.session = False
c.confirm_quit = ["downloads"]

c.downloads.location.directory = "~/dl"
c.downloads.location.prompt = False
c.input.insert_mode.auto_leave = False
c.input.insert_mode.auto_load = True
c.search.ignore_case = "smart"
c.url.searchengines = {
    "DEFAULT": "https://google.com/search?hl=en&q={}",
    "aw": "https://wiki.archlinux.org/?search={}",
    "r": "https://old.reddit.com/r/{}",
    "tw": "https://twitter.com/{}",
    "twitch": "https://twitch.tv/{}",
    "wiki": "https://en.wikipedia.org/?search={}",
    "wh": "https://classic.wowhead.com/search?q={}",
    "yt": "https://youtube.com/results?search_query={}",
    "gh": "https://github.com/{}",
}
c.url.start_pages = "https://kruhlmann.dev/startpage"
c.editor.command = ["alacritty", "-e", "nvim", "{}"]
