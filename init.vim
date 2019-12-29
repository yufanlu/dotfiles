" disable python2, ruby providers
let g:loaded_ruby_provider = 0
let g:loaded_python_provider = 0
let g:python3_host_prog = '/usr/bin/python3'

let b:complete_backend = 'coc'


call plug#begin('~/.config/nvim/plugged')

Plug 'mhinz/vim-startify'
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

if get(b:, 'complete_backend', 'coc') ==? 'coc'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
elseif get(b:, 'complete_backend', 'coc') ==? 'lsp'
  Plug 'neovim/nvim-lsp'
endif

Plug 'tpope/vim-repeat'
Plug 'qpkorr/vim-bufkill'
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'
Plug 'airblade/vim-rooter'

Plug 'junegunn/vim-slash'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-commentary'
Plug 'terryma/vim-multiple-cursors'

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/indentLine'
Plug 'ntpeters/vim-better-whitespace'

" Plug 'tpope/vim-eunuch'
" Plug 'pbrisbin/vim-mkdir'
" Plug 'takac/vim-commandcaps'
" Plug 'ludovicchabant/vim-gutentags'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'justinmk/vim-dirvish'

Plug 'kassio/neoterm'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" python
Plug 'tmhedberg/SimpylFold', {'for': 'python'}
Plug 'jeetsukumaran/vim-pythonsense', {'for': 'python'}
Plug 'numirias/semshi', {'for': 'python', 'do': ':UpdateRemotePlugins'}

" javascript
Plug 'pangloss/vim-javascript', {'for': 'javascript'}


call plug#end()

" settings & mappings
runtime configs/settings.vim
runtime configs/mappings.vim

" colorscheme & airline
let g:base16colorspace=256
colorscheme base16-monokai


" gitgutter, better-whitespace
let g:gitgutter_enabled = 1
let g:strip_whitespace_confirm = 0
let g:strip_whitespace_on_save = 1
let g:better_whitespace_enabled = 1

" ultisnips
nnoremap <c-e><c-u> :UltiSnipsEdit<cr>
let g:UltiSnipsRemoveSelectModeMappings = 0

" semshi
let g:semshi#error_sign = v:false

" fzf, ale, airline, neoterm, vimtex
runtime configs/plugins/fzf.vim
runtime configs/plugins/airline.vim
runtime configs/plugins/neoterm.vim

if get(b:, 'complete_backend', 'coc') ==? 'coc'
  runtime configs/plugins/coc.vim
  runtime configs/plugins/vimtex.vim
elseif get(b:, 'complete_backend', 'coc') ==? 'lsp'
  runtime configs/plugins/lsp.vim
endif

" vim:foldmethod=marker:foldlevel=1
