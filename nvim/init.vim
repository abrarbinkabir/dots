let g:mapleader = "\<Space>"

set nocompatible
syntax on
filetype plugin on
set hidden
set wrap
set encoding=UTF-8
set pumheight=10
set fileencoding=utf-8
set iskeyword+=-
set mouse=a
set splitbelow
set splitright
set t_Co=256
set conceallevel=0
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent
set autoindent
set laststatus=2
set number relativenumber
set background=dark
set noshowmode
set nobackup
set nowritebackup
set updatetime=300
set timeoutlen=100
set formatoptions-=cro
set clipboard=unnamedplus
set cursorline
set termguicolors

call plug#begin()

Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/goyo.vim'
Plug 'ixru/nvim-markdown'
Plug 'preservim/vim-pencil'
call plug#end()

colorscheme catppuccin " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
let g:airline_theme = 'catppuccin'

autocmd BufRead,BufNewFile *.tex set filetype=tex
autocmd BufRead,BufNewFile *.md set filetype=markdown

imap ]bf **<Space>**

