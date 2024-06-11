set background=dark
set number
set relativenumber
set nocompatible
set wrap
set laststatus=2
set encoding=utf-8
set termguicolors
set hlsearch
filetype plugin on
syntax on
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set clipboard=unnamedplus
set mouse=a
set ignorecase
set smartcase
set incsearch
set showmatch
set cursorline
" set lines=41

call plug#begin()

" List your plugins here
Plug 'morhetz/gruvbox'
call plug#end()

colorscheme catppuccin_latte
