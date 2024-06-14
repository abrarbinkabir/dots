local opt = vim.opt -- for conciseness

-- Line numbers
opt.number = true                           -- set numbered lines
opt.relativenumber = true                  -- set relative numbered lines

-- Tabs and indentations
opt.tabstop = 4                             -- insert 2 spaces for a tab
opt.shiftwidth = 4                          -- the number of spaces inserted for each indentation
opt.expandtab = true                        -- convert tabs to spaces
opt.autoindent = true
opt.smartindent = true                      -- make indenting smarter again

-- Appearance
opt.background = "light"
opt.termguicolors = true                    -- set term gui colors (most terminals support this)
opt.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time

-- Cursorline
opt.cursorline = true                       -- highlight the current line

-- Line wrapping
opt.wrap = true                            -- display lines as one long line

-- Search
opt.hlsearch = true                         -- highlight all matches on previous search pattern
opt.ignorecase = true                       -- ignore case in search patterns
opt.smartcase = true                        -- smart case

-- Backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- Clipboard
opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard

-- Mouse
opt.mouse = "a"                             -- allow the mouse to be used in neovim

-- Window splitting
opt.splitbelow = true                       -- force all horizontal splits to go below current window
opt.splitright = true                       -- force all vertical splits to go to the right of current window

-- Others
opt.fileencoding = "utf-8"                  -- the encoding written to a file
opt.swapfile = false                        -- creates a swapfile
opt.updatetime = 300                        -- faster completion (4000ms default)
opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
opt.scrolloff = 8                           -- is one of my fav
opt.sidescrolloff = 8

-- Netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
