# pylint: skip-file
from imports import colors
from imports import binds
from imports import aliases
from imports import javascript
from imports import user_agent
from imports import content
from imports import fonts
from imports import layout
from imports import notifications

aliases.apply(c)
colors.apply(c)
javascript.apply(c)
fonts.apply(c)
layout.apply(c)
binds.apply(config)
user_agent.apply(config)
content.apply(config, c)
notifications.apply(config)

c.auto_save.session = True
c.confirm_quit = ["downloads"]
c.downloads.location.directory = "~/Downloads"
c.downloads.location.prompt = False
c.input.insert_mode.auto_leave = True
c.input.insert_mode.auto_load = True
c.search.ignore_case = "smart"
c.url.searchengines = {
    "DEFAULT": "https://google.com/search?hl=en&q={}",
    "4": "https://4chan.org/{}",
    "aw": "https://wiki.archlinux.org/?search={}",
    "r": "https://old.reddit.com/r/{}",
    "stp": "https://stp.siemens.dk/{}",
    "tw": "https://twitter.com/{}",
    "twitch": "https://twitch.tv/{}",
    "wiki": "https://en.wikipedia.org/?search={}",
    "wh": "https://classic.wowhead.com/search?q={}",
    "yt": "https://youtube.com/results?search_query={}",
}
c.url.start_pages = "https://google.com"
c.editor.command = ["alacritty", "--class", "floatterm", "-e", "nvim", "{}"]
