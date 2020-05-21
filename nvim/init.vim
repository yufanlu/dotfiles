" disable built-in plugins
let g:loaded_tar = 1
let g:loaded_zip = 1
let g:loaded_gzip = 1
let g:loaded_netrw = 1
let g:loaded_tarPlugin = 1
let g:loaded_zipPlugin = 1
let g:loaded_netrwPlugin = 1


" disable python2, ruby providers
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0
let g:loaded_python_provider = 0
let g:python3_host_prog = 'python3'


call plug#begin('~/.config/nvim/plugged')

Plug 'neovim/nvim-lsp'

" Plug 'mhinz/vim-startify'
Plug 'chriskempson/base16-vim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

" Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'Konfekt/FastFold'
" Plug 'tpope/vim-repeat'
" Plug 'qpkorr/vim-bufkill'
" Plug 'tpope/vim-surround'
" Plug 'wellle/targets.vim'
Plug 'airblade/vim-rooter'

Plug 'junegunn/vim-slash'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-commentary'
Plug 'terryma/vim-multiple-cursors'

Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/indentLine'
Plug 'ntpeters/vim-better-whitespace'

" Plug 'tpope/vim-eunuch'
" Plug 'pbrisbin/vim-mkdir'
" Plug 'takac/vim-commandcaps'
" Plug 'ludovicchabant/vim-gutentags'

Plug 'tpope/vim-fugitive'
" Plug 'airblade/vim-gitgutter'
" Plug 'justinmk/vim-dirvish'

" Plug 'kassio/neoterm'

" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

" " python
Plug 'kalekundert/vim-coiled-snake', {'for': 'python'}
Plug 'jeetsukumaran/vim-pythonsense', {'for': 'python'}
Plug 'numirias/semshi', {'for': 'python', 'do': ':UpdateRemotePlugins'}

" " javascript
" Plug 'pangloss/vim-javascript', {'for': 'javascript'}


call plug#end()

" settings & mappings
runtime config/settings.vim
runtime config/mappings.vim

" colorscheme & airline
let g:base16colorspace=256
colorscheme base16-nord

" gitgutter, better-whitespace
let g:gitgutter_enabled = 1
let g:strip_whitespace_confirm = 0
let g:strip_whitespace_on_save = 1
let g:better_whitespace_enabled = 1

set completeopt-=preview
set completeopt+=longest,noselect,noinsert

" semshi
let g:semshi#error_sign = v:false

runtime config/plugins/fzf.vim

" runtime config/plugins/airline.vim
" runtime config/plugins/neoterm.vim

" runtime config/plugins/coc.vim
" runtime config/plugins/vimtex.vim

lua require('lsp')
runtime config/plugins/lsp.vim

" vim:foldmethod=marker:foldlevel=1
