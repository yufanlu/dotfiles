
" config variables
let g:skip_loading_mswin = 1
let b:complete_backend = 'ncm2'    " ncm2, coc, ycmd


" disable python2, ruby providers
let g:load_ruby_provider = 1
let g:load_node_provider = 1


if has('win32')
  let b:plugged_folder = '~/AppData/Local/nvim/plugged'
else
  let b:plugged_folder = '~/.config/nvim/plugged'
endif


call plug#begin(b:plugged_folder)

Plug 'mhinz/vim-startify'
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


Plug 'tpope/vim-repeat'
Plug 'qpkorr/vim-bufkill'
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'
Plug 'airblade/vim-rooter'
Plug 'AndrewRadev/sideways.vim'

Plug 'junegunn/vim-slash'
Plug 'Valloric/ListToggle'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-commentary'

Plug 'terryma/vim-multiple-cursors'

Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/indentLine'
Plug 'ntpeters/vim-better-whitespace'

Plug 'tpope/vim-eunuch'
Plug 'pbrisbin/vim-mkdir'
Plug 'takac/vim-commandcaps'

Plug 'ludovicchabant/vim-gutentags'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'kassio/neoterm'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Shougo/echodoc.vim'

Plug 'w0rp/ale'
Plug 'Chiel92/vim-autoformat'

if get(b:, 'complete_backend', 'ycmd') ==? 'ycmd'
  Plug 'Valloric/YouCompleteMe', {'do': 'python install.py'}
endif

if get(b:, 'complete_backend', 'ycmd') ==? 'coc'
  Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install() }}
endif

if get(b:, 'complete_backend', 'ycmd') ==? 'ncm2'
  Plug 'ncm2/ncm2' | Plug 'roxma/nvim-yarp'
  Plug 'ncm2/ncm2-vim' | Plug 'Shougo/neco-vim'
  Plug 'ncm2/ncm2-path'
  Plug 'ncm2/ncm2-bufword'
  Plug 'ncm2/ncm2-ultisnips'
  Plug 'ncm2/ncm2-tagprefix'

  Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'sh install.sh'}
endif

Plug 'tmhedberg/SimpylFold', {'for': 'python'}
Plug 'jeetsukumaran/vim-pythonsense', {'for': 'python'}

Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

call plug#end()

" settings & mappings
runtime configs/settings.vim
runtime configs/mappings.vim

" colorscheme & airline
let g:base16colorspace=256
colorscheme base16-monokai
" runtime configs/plugins/airline.vim

" gitgutter, better-whitespace, echodoc
let g:gitgutter_enabled = 1
let g:strip_whitespace_confirm = 0
let g:strip_whitespace_on_save = 1
let g:better_whitespace_enabled = 1
let g:echodoc_enable_at_startup = 1

" vim-plug
command! PU PlugUpdate | PlugUpgrade
command! PI PlugInstall
command! PC PlugClean

" sideways
nnoremap <a-h> :SidewaysLeft<cr>
nnoremap <a-l> :SidewaysRight<cr>

" ultisnips
nnoremap <c-e><c-u> :UltiSnipsEdit<cr>
let g:UltiSnipsRemoveSelectModeMappings = 0

" nerdtree
let g:NERDTreeIgnore=['\.pyc$', '\~$', '__pycache__', '_minted-*', 'node_modules']
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" autoformat
let g:formatters_python = ['autopep8']
noremap <F4> :Autoformat<cr>

" semshi
let g:semshi#error_sign = v:false

" fzf, ale, airline, neoterm
runtime configs/plugins/fzf.vim
runtime configs/plugins/ale.vim
runtime configs/plugins/airline.vim
runtime configs/plugins/neoterm.vim


if get(b:, 'complete_backend', 'ycmd') ==? 'ycmd'
  runtime configs/plugins/ycmd.vim
endif

if get(b:, 'complete_backend', 'ycmd') ==? 'coc'
  runtime configs/plugins/coc.vim
endif

if get(b:, 'complete_backend', 'ycmd') ==? 'ncm2'
  runtime configs/plugins/ncm2.vim
  runtime configs/plugins/lsp.vim
endif


" vim:foldmethod=marker:foldlevel=1
