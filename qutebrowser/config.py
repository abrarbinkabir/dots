config.load_autoconfig(False)

config.set('content.cookies.accept', 'all', 'chrome-devtools://*')
config.set('content.cookies.accept', 'all', 'devtools://*')

config.set('content.headers.accept_language', '', 'https://matchmaker.krunker.io/*')

config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}', 'https://web.whatsapp.com/')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:90.0) Gecko/20100101 Firefox/90.0', 'https://accounts.google.com/*')

config.set('content.images', True, 'chrome-devtools://*')
config.set('content.images', True, 'devtools://*')

config.set('content.javascript.enabled', True, 'chrome-devtools://*')
config.set('content.javascript.enabled', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome://*/*')
config.set('content.javascript.enabled', True, 'qute://*/*')

config.set('content.local_content_can_access_remote_urls', True, 'file:///home/abrar/.local/share/qutebrowser/userscripts/*')
config.set('content.local_content_can_access_file_urls', False, 'file:///home/abrar/.local/share/qutebrowser/userscripts/*')

import color
color.setup(c)

c.auto_save.session = True
c.completion.height = '30%'
c.completion.scrollbar.width = 10
c.completion.use_best_match = True
c.completion.open_categories = ["bookmarks", "history", "quickmarks", "searchengines", "filesystem"]
c.content.autoplay = False
c.content.blocking.method = 'both'
c.content.cookies.accept = 'all'
c.content.default_encoding = 'utf-8'
c.content.notifications.enabled = False
c.content.geolocation= False
c.content.pdfjs = True
c.downloads.location.directory = '~/Downloads'
c.downloads.location.suggestion = 'both'
c.downloads.position = 'bottom'
c.downloads.remove_finished = 3
c.editor.command = ["nvim", "-f", "{file}", "-c", "normal {line}G{column0}l"]

c.fonts.completion.category = '11pt JetBrainsMono Nerd Font Propo'
c.fonts.completion.entry = '11pt JetBrainsMono Nerd Font Propo'
c.fonts.contextmenu = '10pt Inter'
c.fonts.debug_console = '11pt JetBrainsMono Nerd Font Propo'
c.fonts.default_family = 'JetBrainsMono Nerd Font Propo'
c.fonts.default_size = '11pt'
c.fonts.downloads = '11pt JetBrainsMono Nerd Font Propo'
c.fonts.hints = '11pt JetBrainsMono Nerd Font Propo'
c.fonts.keyhint = '11pt JetBrainsMono Nerd Font Propo'
c.fonts.messages.error = '11pt JetBrainsMono Nerd Font Propo'
c.fonts.messages.info = '11pt JetBrainsMono Nerd Font Propo'
c.fonts.messages.warning = '11pt JetBrainsMono Nerd Font Propo'
c.fonts.prompts = '11pt JetBrainsMono Nerd Font Propo'  
c.fonts.statusbar = '11pt JetBrainsMono Nerd Font Propo'
c.fonts.tabs.selected = '11pt Inter'
c.fonts.tabs.unselected = '11pt Inter'
c.fonts.tooltip = '11pt Inter'
c.fonts.web.family.fixed = 'JetBrainsMono Nerd Font Propo'
c.fonts.web.family.sans_serif = 'Inter'
c.fonts.web.family.serif = 'Inter'
c.fonts.web.family.standard = 'Inter'

c.hints.border = '0px'
c.statusbar.widgets = ["keypress", "search_match", "url", "scroll", "history", "progress"]
# c.scrolling.bar = 'when-searching'
c.tabs.favicons.scale = 0.8
c.tabs.indicator.width = 0
c.tabs.last_close = 'startpage'
c.tabs.padding = {"bottom": 2, "left": 5, "right": 5, "top": 2}
c.tabs.show = 'multiple'
c.tabs.title.format = '{current_title}'
c.url.default_page = 'file:///home/abrar/Documents/git/startpage/index.html'
c.url.start_pages = 'file:///home/abrar/Documents/git/startpage/index.html'
c.url.open_base_url = True
c.url.searchengines = {
    'DEFAULT': 'https://duckduckgo.com/?q={}',
    'yt': 'https://www.youtube.com/results?search_query={}',
    'aw': 'https://wiki.archlinux.org/?search={}',
    'gh': 'https://www.github.com/{}',
    'mp': 'https://man.archlinux.org/man/{}',
    'ar': 'https://aur.archlinux.org/packages?O=0&K={}',
    'rd': 'https://www.reddit.com/r/{}',
    'gg': 'https://www.google.com/search?q={}',
    'wp': 'https://en.wikipedia.org/wiki/{}',
    'rm': 'https://www.rokomari.com/search?term={}&search_type=BOOK',
    'cc': 'https://www.collinsdictionary.com/dictionary/english/{}',
}

# Bindings for normal mode
config.bind('xv', 'hint links spawn mpv {hint-url}')
config.bind('xd', 'hint links spawn alacritty -e yt-dlp {hint-url}')
# config.bind('t', 'set-cmd-text -s :open -t')
config.bind('ts', 'config-cycle statusbar.show always never')
config.bind('tt', 'config-cycle tabs.show always never')
config.bind('tb', 'config-cycle statusbar.show always never;; config-cycle tabs.show always never')
config.unbind('d', mode='normal')

c.content.blocking.adblock.lists = [
    'https://easylist.to/easylist/easylist.txt',
    'https://easylist.to/easylist/easyprivacy.txt',
    'https://easylist-downloads.adblockplus.org/easylistdutch.txt',
    'https://easylist-downloads.adblockplus.org/abp-filters-anti-cv.txt',
    'https://www.i-dont-care-about-cookies.eu/abp/',
    'https://secure.fanboy.co.nz/fanboy-cookiemonster.txt'
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/annoyances.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/badlists.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/badware.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters-2020.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters-2021.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/privacy.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/resource-abuse.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/thirdparties/easylist-downloads.adblockplus.org/easyprivacy.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/thirdparties/pgl.yoyo.org/as/serverlist",
    "https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling/hosts",
    "https://raw.githubusercontent.com/AdAway/adaway.github.io/master/hosts.txt",
    "https://fanboy.co.nz/fanboy-problematic-sites.txt",
    "https://raw.githubusercontent.com/bogachenko/fuckfuckadblock/master/fuckfuckadblock.txt"
]
