# pylint: skip-file
from qutebrowser.config.configfiles import ConfigAPI


def apply(config: ConfigAPI):
    config.set("content.headers.user_agent",
               "Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}",
               "https://web.whatsapp.com/")
    config.set("content.headers.user_agent",
               "Mozilla/5.0 ({os_info}; rv:71.0) Gecko/20100101 Firefox/71.0",
               "https://accounts.google.com/*")
    config.set("content.headers.user_agent",
               "Mozilla/5.0 ({os_info}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99 Safari/537.36",
               "https://*.slack.com/*")
    config.set("content.headers.user_agent",
               "Mozilla/5.0 ({os_info}; rv:71.0) Gecko/20100101 Firefox/71.0",
               "https://docs.google.com/*")
