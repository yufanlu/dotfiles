if exists('b:settings_loaded')
  finish
endif

let b:settings_loaded = 1


set list
set listchars=tab:▸\ ,eol:¬

set nowrap
set mouse=a
set ignorecase
set noshowmode
set nolazyredraw
set laststatus=2
set shortmess+=c

" set number
" set relativenumber

set fileformat=unix
set fileformats=unix,dos

set ttimeout
set ttimeoutlen=100

set noswapfile
set nowritebackup

set splitright
set clipboard+=unnamedplus

" tab and indent configuration
set tabstop=8
set shiftwidth=4
set softtabstop=4
set expandtab


if has('termguicolors')
  set termguicolors
endif

let g:mapleader = ','
