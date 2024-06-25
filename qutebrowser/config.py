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



# import catppuccin
# config.load_autoconfig()
# catppuccin.setup(c, 'frappe', True)

c.auto_save.session = True
c.completion.height = '30%'
c.completion.scrollbar.width = 5
c.completion.use_best_match = True
c.completion.open_categories = ["bookmarks", "history", "quickmarks", "searchengines", "filesystem"]
c.content.autoplay = False
c.content.blocking.method = 'both'
c.content.cookies.accept = 'no-3rdparty'
c.content.default_encoding = 'utf-8'
c.content.geolocation= False
c.content.pdfjs = True
c.downloads.location.directory = '~/Downloads'
c.downloads.location.suggestion = 'both'
c.downloads.position = 'bottom'
c.downloads.remove_finished = 3
c.editor.command = ["nvim", "-f", "{file}", "-c", "normal {line}G{column0}l"]

c.fonts.completion.category = '11pt Inter SemiBold'
c.fonts.completion.entry = '11pt Inter'
c.fonts.contextmenu = '10pt Inter'
c.fonts.debug_console = '11pt Inter'
c.fonts.default_family = 'Inter'
c.fonts.default_size = '11pt'
c.fonts.downloads = '11pt Inter'
c.fonts.hints = '11pt Inter'
c.fonts.keyhint = '11pt Inter'
c.fonts.messages.error = '11pt Inter'
c.fonts.messages.info = '11pt Inter'
c.fonts.messages.warning = '11pt Inter'
c.fonts.prompts = '11pt Inter'  
c.fonts.statusbar = '11pt Inter'
c.fonts.tabs.selected = '11pt Inter'
c.fonts.tabs.unselected = '11pt Inter'
c.fonts.tooltip = '11pt Inter'
c.fonts.web.family.fixed = 'JetBrainsMono NFP'
c.fonts.web.family.sans_serif = 'Inter'
c.fonts.web.family.serif = 'Inter'
c.fonts.web.family.standard = 'Inter'

c.scrolling.bar = 'when-searching'
c.tabs.favicons.scale = 0.8
c.tabs.indicator.width = 0
c.tabs.last_close = 'startpage'
c.tabs.show = 'multiple'
c.tabs.title.format = '{current_title}'
c.url.default_page = 'file:///home/abrar/Documents/70-tech/86-git/startpage/index.html'
c.url.start_pages = 'file:///home/abrar/Documents/70-tech/86-git/startpage/index.html'
c.url.open_base_url = True
c.url.searchengines = {'DEFAULT': 'https://duckduckgo.com/?q={}', 'aw': 'https://wiki.archlinux.org/?search={}', 'goog': 'https://www.google.com/search?q={}', 're': 'https://www.reddit.com/r/{}', 'ub': 'https://www.urbandictionary.com/define.php?term={}', 'wiki': 'https://en.wikipedia.org/wiki/{}', 'yt': 'https://www.youtube.com/results?search_query={}'}
