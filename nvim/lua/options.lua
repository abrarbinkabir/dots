local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tabs and indentations
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- Appearance
opt.termguicolors = true
opt.signcolumn = "yes"

-- Cursorline
opt.cursorline = true

-- Line wrapping
opt.wrap = true

-- Search
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard = "unnamedplus"

-- Mouse
opt.mouse = "a"

-- Window splitting
opt.splitbelow = true
opt.splitright = true

-- Others
opt.fileencoding = "utf-8"
opt.swapfile = false
opt.updatetime = 300
opt.writebackup = false
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
