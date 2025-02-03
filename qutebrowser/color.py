def setup(c):
    theme = {
    "rosewater":  "#f2d5cf",
    "flamingo":   "#eebebe",
    "pink":       "#f4b8e4",
    "mauve":      "#ca9ee6",
    "red":        "#e78284",
    "maroon":     "#ea999c",
    "peach":      "#ef9f76",
    "yellow":     "#e5c890",
    "green":      "#a6d189",
    "teal":       "#81c8be",
    "sky":        "#99d1db",
    "sapphire":   "#85c1dc",
    "blue":       "#8caaee",
    "lavender":   "#babbf1",
    "text":       "#c6d0f5",
    "subtext1":   "#b5bfe2",
    "subtext0":   "#a5adce",
    "overlay2":   "#949cbb",
    "overlay1":   "#838ba7",
    "overlay0":   "#737994",
    "surface2":   "#626880",
    "surface1":   "#51576d",
    "surface0":   "#414559",
    "base":       "#303446",
    "mantle":     "#292c3c",
    "crust":      "#232634",
    }


    c.colors.completion.category.bg = theme["crust"] 
    c.colors.completion.category.border.bottom =  theme["crust"]
    c.colors.completion.category.border.top = theme["crust"]
    c.colors.completion.category.fg = theme["blue"]
    c.colors.completion.even.bg = theme["base"]
    c.colors.completion.odd.bg = theme["base"]
    c.colors.completion.fg = theme["text"] 
    c.colors.completion.item.selected.bg = theme["blue"]
    c.colors.completion.item.selected.fg = theme["base"]
    c.colors.completion.item.selected.border.bottom = theme["blue"]
    c.colors.completion.item.selected.border.top = theme["blue"]
    c.colors.completion.match.fg = theme["peach"]
    c.colors.completion.item.selected.match.fg = theme["base"]
    c.colors.completion.scrollbar.bg = theme["surface0"]
    c.colors.completion.scrollbar.fg = theme["surface2"]
    
    c.colors.contextmenu.disabled.fg = theme["overlay1"]
    c.colors.contextmenu.menu.bg = theme["crust"]
    c.colors.contextmenu.menu.fg = theme["text"]
    c.colors.contextmenu.selected.bg = theme["blue"]
    c.colors.contextmenu.selected.fg = theme["base"]

    c.colors.downloads.bar.bg = theme["green"]
    c.colors.downloads.error.bg = theme["red"]
    c.colors.downloads.error.fg = theme["base"]
    c.colors.downloads.start.bg = theme["green"]
    c.colors.downloads.start.fg = theme["base"]
    c.colors.downloads.stop.bg = theme["green"]
    c.colors.downloads.stop.fg = theme["base"]

    c.colors.hints.bg = theme["peach"]
    c.colors.hints.fg = theme["base"]
    c.colors.hints.match.fg = theme["base"] 

    c.colors.keyhint.bg = theme["crust"]
    c.colors.keyhint.fg = theme["text"]
    c.colors.keyhint.suffix.fg = theme["peach"] 

    c.colors.messages.error.bg = theme["red"]
    c.colors.messages.error.border = theme["crust"]
    c.colors.messages.error.fg = theme["base"]
    c.colors.messages.info.bg = theme["blue"]
    c.colors.messages.info.border = theme["blue"]
    c.colors.messages.info.fg = theme["base"]
    c.colors.messages.warning.bg = theme["peach"]
    c.colors.messages.warning.border = theme["peach"]
    c.colors.messages.warning.fg = theme["base"]

    c.colors.prompts.bg =  theme["crust"]
    c.colors.prompts.fg = theme["text"]
    c.colors.prompts.border = '1px solid theme["green"]'
    c.colors.prompts.selected.bg = theme["base"] 
    c.colors.prompts.selected.fg = theme["text"]

    c.colors.statusbar.caret.bg = theme["crust"]
    c.colors.statusbar.caret.fg = theme["pink"]
    c.colors.statusbar.caret.selection.bg = theme["crust"]
    c.colors.statusbar.caret.selection.fg = theme["pink"]
    c.colors.statusbar.command.bg = theme["crust"] 
    c.colors.statusbar.command.fg = theme["peach"]
    c.colors.statusbar.command.private.bg = theme["crust"] 
    c.colors.statusbar.command.private.fg = theme["peach"]
    c.colors.statusbar.insert.bg = theme["crust"]
    c.colors.statusbar.insert.fg = theme["green"]
    c.colors.statusbar.normal.bg = theme["crust"]
    c.colors.statusbar.normal.fg = theme["text"]
    c.colors.statusbar.passthrough.bg = theme["crust"] 
    c.colors.statusbar.passthrough.fg = theme["yellow"]
    c.colors.statusbar.private.bg = theme["crust"]
    c.colors.statusbar.private.fg = theme["text"]
    c.colors.statusbar.progress.bg = theme["green"]
    c.colors.statusbar.url.error.fg = theme["red"]
    c.colors.statusbar.url.fg = theme["green"]
    c.colors.statusbar.url.hover.fg = theme["yellow"]
    c.colors.statusbar.url.success.http.fg = theme["green"]
    c.colors.statusbar.url.success.https.fg = theme["green"]
    c.colors.statusbar.url.warn.fg = theme["peach"]
    
    c.colors.tabs.bar.bg =  theme["base"]
    c.colors.tabs.even.bg = theme["surface1"]
    c.colors.tabs.even.fg = theme["subtext0"]
    c.colors.tabs.odd.bg = theme["surface1"]
    c.colors.tabs.odd.fg = theme["subtext0"]
    c.colors.tabs.selected.even.bg = theme["base"]
    c.colors.tabs.selected.even.fg = theme["text"]
    c.colors.tabs.selected.odd.bg = theme["base"]
    c.colors.tabs.selected.odd.fg = theme["text"]
    
    c.colors.tooltip.bg = theme["crust"]
    c.colors.tooltip.fg = theme["text"]
