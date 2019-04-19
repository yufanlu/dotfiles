
" config variables
let g:skip_loading_mswin = 1
let b:complete_backend = 'coc'    " ncm2, coc, ycmd

" disable python2, ruby providers
let g:loaded_ruby_provider = 1
let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'


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

Plug 'justinmk/vim-sneak'
Plug 'justinmk/vim-dirvish'

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'kassio/neoterm'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'lervag/vimtex'
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}

if get(b:, 'complete_backend', 'coc') ==? 'ycmd'
  Plug 'Shougo/echodoc.vim'
  Plug 'Valloric/ListToggle'
  Plug 'Chiel92/vim-autoformat'
  Plug 'Valloric/YouCompleteMe', {'do': 'python install.py'}
endif

if get(b:, 'complete_backend', 'coc') ==? 'coc'
  Plug 'Shougo/neco-vim'
  Plug 'neoclide/coc-neco'
  Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install() }}
endif

Plug 'tmhedberg/SimpylFold', {'for': 'python'}
Plug 'jeetsukumaran/vim-pythonsense', {'for': 'python'}
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

Plug 'RobRoseKnows/lark-vim'
Plug 'leafgarland/typescript-vim', {'for': 'typescript'}
Plug 'posva/vim-vue', {'for': 'vue'}

call plug#end()

" settings & mappings
runtime configs/settings.vim
runtime configs/mappings.vim

" colorscheme & airline
let g:base16colorspace=256
colorscheme base16-monokai

" gitgutter, better-whitespace, echodoc
let g:sneak#label = 1
let g:gitgutter_enabled = 1
let g:strip_whitespace_confirm = 0
let g:strip_whitespace_on_save = 1
let g:better_whitespace_enabled = 1
" let g:echodoc_enable_at_startup = 1

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

" autoformat
" let g:formatters_python = ['autopep8']
" noremap <F4> :Autoformat<cr>

" semshi
let g:semshi#error_sign = v:false

" fzf, ale, airline, neoterm, vimtex
runtime configs/plugins/fzf.vim
runtime configs/plugins/airline.vim
runtime configs/plugins/neoterm.vim
runtime configs/plugins/vimtex.vim

if get(b:, 'complete_backend', 'ycmd') ==? 'ycmd'
  runtime configs/plugins/ycmd.vim
endif

if get(b:, 'complete_backend', 'ycmd') ==? 'coc'
  runtime configs/plugins/coc.vim
endif

" use for lark
autocmd BufRead,BufNewFile *.lark set filetype=antlr4


" vim:foldmethod=marker:foldlevel=1
