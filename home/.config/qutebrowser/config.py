config.bind('t', 'set-cmd-text -s :open -t')

config.bind('O', 'set-cmd-text :open {url:pretty}')

config.bind('h', 'tab-prev')
config.bind('gr', 'tab-prev')
config.bind('l', 'tab-next')
config.bind('gt', 'tab-next')

config.bind('b', 'set-cmd-text -s :buffer')

config.bind('gi', 'hint inputs')

config.bind('<Ctrl-i>', 'open-editor', mode='insert')
# config.bind('<Ctrl-u>', 'rl-unix-line-discard', mode='insert')
# config.bind('<Ctrl-a>', 'rl-beginning-of-line', mode='insert')
# config.bind('<Ctrl-e>', 'rl-end-of-line', mode='insert')
# config.bind('<Ctrl-w>', 'rl-end-word-rubout', mode='insert')

# c.content.proxy = 'socks://localhost:7070'

c.url.searchengines = {
    "DEFAULT": "https://www.google.com/search?q={}",
    "d": "https://duckduckgo.com/?q={}",
    "r": "https://reddit.com/r/{}",
    "c": "https://4chan.org/{}/catalog",
    "y": "https://youtube.com/results?search_query={}",
    "aw": "https://wiki.archlinux.org/?search={}"
}
c.content.headers.user_agent = 'Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101 Firefox/52.0'
c.tabs.background = True


c.downloads.location.remember = True
c.url.start_pages = "file:///home/kassio/.startpage/startpage.html"
config.bind('gh', 'home')

