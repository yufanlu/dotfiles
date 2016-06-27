" vimrc

" ==================================
"
set nocompatible

" Plugins {{{
call plug#begin('~/.vim/plugged')

" UI
Plug 'whatyouhide/vim-gotham'
Plug 'mhartington/oceanic-next'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Behavior
Plug 'tpope/vim-repeat'
Plug 'majutsushi/tagbar', { 'for': ['cpp', 'python'] }
Plug 'godlygeek/tabular'
Plug 'mhinz/vim-startify'
Plug 'pbrisbin/vim-mkdir'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'Raimondi/delimitMate',  { 'for': ['cpp', 'python'] }
Plug 'kshenoy/vim-signature', { 'for': ['cpp', 'python'] }
Plug 'takac/vim-commandcaps'
"Plug 'tpope/vim-speeddating'
Plug 'lifepillar/vim-cheat40'
Plug 'vim-scripts/matchit.zip'
Plug 'scrooloose/nerdcommenter'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
Plug 'ntpeters/vim-better-whitespace'

" Search
"Plug 'mileszs/ack.vim'
"Plug 'haya14busa/incsearch.vim'

" File system
"Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Shougo/vimfiler.vim', { 'on': 'VimFilerExplorer' }


" Fuzzy Search
Plug 'Shougo/unite.vim'
Plug 'Shougo/unite-outline'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" static syntax check
Plug 'scrooloose/syntastic', { 'for': ['cpp', 'python'] }

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Autocomplete
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer'}

" Asynchronous
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

" Writing
Plug 'reedes/vim-pencil', {'for': 'markdown'}
Plug 'junegunn/goyo.vim', {'for': 'markdown'}
Plug 'kannokanno/previm', {'for': 'markdown'}
Plug 'tyru/open-browser.vim', {'for': 'markdown'}
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'dhruvasagar/vim-table-mode', {'for': 'markdown'}

"Plug 'reedes/vim-wordy'

" language packs
Plug 'sheerun/vim-polyglot'

" C++
Plug 'vim-jp/vim-cpp', {'for': 'cpp'}
Plug 'octol/vim-cpp-enhanced-highlight', {'for': 'cpp'}

" Latex
Plug 'lervag/vimtex', {'for': 'tex'}
Plug 'matze/vim-tex-fold', {'for': 'tex' }

" Python
Plug 'hdima/python-syntax' , {'for': 'python'}
Plug 'tmhedberg/SimpylFold', {'for': 'python'}
Plug 'davidhalter/jedi-vim', {'for': 'python'}
Plug 'glench/vim-jinja2-syntax', {'for': 'html'}
Plug 'lepture/vim-jinja', {'for': 'html'}

" Web Dev
Plug 'mattn/emmet-vim', {'for': 'html'}
Plug 'Quramy/tsuquyomi', {'for': 'typescript'}
Plug 'mhartington/vim-typings', {'for': 'typescript'}
Plug 'leafgarland/typescript-vim', {'for': 'typescript'}


" Database
"Plug 'krisajenkins/vim-pipe'
"Plug 'vim-scripts/dbext.vim'

" OmniSharp
"Plug 'OmniSharp/omnisharp-vim'


" plugins to learn
"Plug 'ledger/vim-ledger'
"Plug 'wellle/targets.vim'

call plug#end()

syntax on
filetype plugin indent on
" }}}

" UI configuration {{{
set wrap                                      " wrap lines
set ruler                                     " show 'line #', 'col #', etc
set number                                    " line number
set mouse=a                                   " enable mouse action
set history=200                               " command history
set showcmd                                   " show command in bottom bar
set lazyredraw                                " redraw only when we need to.
set noshowmatch                               " np highlight matching [{()}]
set relativenumber
set guifont=Sauce\ Code\ Powerline\ Light:h11 " font face/size
"set guifont=Sauce\ Code\ Powerline:h11

" colorscheme
set t_Co=256
"colorscheme gotham256
colorscheme OceanicNext

" turn off scroll bar if using MacVim
if has("gui_running")
   set linespace=1
   set guioptions=gm
   set fuoptions=maxvert,maxhorz
end

" Status Line configuration
syntax enable
set laststatus=2
set encoding=utf-8
set background=dark
set fillchars+=stl:\ ,stlnc:\
" }}}

" General Config {{{
set ttimeout
set ttimeoutlen=100

" Turn off sound
set vb
set t_vb=

" Turn off backup
set nobackup
set noswapfile
set nowritebackup

" Auto reload file
set autoread

" use comma as leader key
let mapleader   = ","
let g:mapleader = ","

" Navigation key configuration
map j gj
map k gk
set whichwrap+=<,>,h,l
set backspace=eol,start,indent

nmap <F2> :set nowrap! <cr>
nmap <c-s> :w!<cr>
nmap <leader>w :w!<cr>
"nmap <leader>e :NERDTreeToggle<cr>
nmap <leader>e :VimFilerExplorer<cr>
nnoremap <leader><space> :nohlsearch<cr>

" Search configuration
set ignorecase                                      " ignore case when searching
set smartcase                                       " turn on smartcase
set hlsearch                                        " highlight search
set incsearch                                       " incremental search (search as type)

" Tab and Indent configuration
set ai                                              " Auto indent
set si                                              " Smart indent
set tabstop=4
set expandtab
set shiftwidth=4

" buffer
set hidden

" Folding
set foldenable                                      " enable folding
set foldnestmax=10                                  " max 10 depth
set foldmethod=syntax                               " fold based on indent level
set foldlevelstart=10                               " start with fold level of 1
nnoremap <space> za                                 " space open/closes folds

" }}}

" Behavior  {{{

" H & L
vnoremap H ^
vnoremap L $

" m
vnoremap m %

" Don't go to Ex mode
nnoremap Q <nop>
inoremap <c-h> <Nop>
inoremap <c-j> <Nop>
inoremap <c-k> <Nop>
inoremap <c-l> <Nop>

" F5 to compile
map <F5> :make!<cr>

" Editing/Loading .vimrc
nnoremap <c-e><c-v> :vs ~/.vimrc<cr>
nnoremap <c-e><c-l> :so ~/.vimrc<cr>
" }}}

" Tagbar {{{
nmap <F8> :TagbarToggle<cr>
" }}}

" vim-airline {{{
let g:airline_powerline_fonts = 1
"let g:airline_theme='gotham256'
let g:airline_theme='oceanicnext'
"let g:airline_left_sep  = ''
"let g:airline_right_sep = ''

" tabline
let g:airline#extensions#tabline#left_sep       = ''
let g:airline#extensions#tabline#left_alt_sep   = ''
let g:airline#extensions#tabline#right_sep      = ''
let g:airline#extensions#tabline#right_alt_sep  = ''
let g:airline#extensions#tabline#fnamemod       = ':t'       " Show just the filename

" quickfix
let g:airline#extensions#quickfix#quickfix_text = 'Quickfix' " configure the title text for quickfix buffers
let g:airline#extensions#quickfix#location_text = 'Location' " configure the title text for location list buffers

" ycm
let g:airline#extensions#ycm#error_symbol   = 'E:'           " set error count prefix
let g:airline#extensions#ycm#warning_symbol = 'W:'           " set warning count prefix
" }}}

" Unite {{{
nnoremap <c-e><c-p> :Unite -start-insert file_rec/async<cr>
nnoremap <c-e><c-b> :Unite -winheight=15 buffer bookmark<cr>
nnoremap <c-e><c-o> :Unite -vertical -direction=botright -winwidth=45 outline<cr>
"nnoremap <c-e><c-f> :Unite -start-insert -direction=belowright grep:.<cr>
"let g:unite_source_grep_command = 'ag'
" }}}

" Fugitive {{{
nnoremap <silent> <leader>gs :Gstatus<cr>
nnoremap <silent> <leader>gd :Gdiff<cr>
nnoremap <silent> <leader>gc :Gcommit<cr>
nnoremap <silent> <leader>gb :Gblame<cr>
nnoremap <silent> <leader>gl :Glog<cr>
nnoremap <silent> <leader>gp :Git push<cr>
nnoremap <silent> <leader>gw :Gwrite<cr>
nnoremap <silent> <leader>gr :Gremove<cr>
"autocmd BufReadPost fugitive://* set bufhidden=delete
" }}}

" Syntastic {{{
let g:syntastic_tex_checkers = 0
let g:syntastic_always_populate_loc_list = 1
" }}}

" YCM and UltiSnips {{{
let g:ycm_python_binary_path    = '/usr/local/bin/python'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_complete_in_comments_and_strings = 1
"let g:ycm_autoclose_preview_window_after_insertion  = 1
"let g:ycm_autoclose_preview_window_after_completion = 1
set omnifunc=syntaxcomplete#Complete

" make YCM compatible with UltiSnips
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']

" key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<TAB>"
let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

let g:UltiSnipsEditSplit = "vertical"
let g:UltiSnipsSnippetsDir = "~/dotfiles/snips"
nnoremap <c-e><c-u> :UltiSnipsEdit<cr>
" }}}

" delimitMate {{{
au FileType tex let b:loaded_delimitMate = 0
au FileType markdown let b:delimitMate_autoclose = 0
" }}}

" vimtex {{{
let g:tex_flavor  = 'latex'
let g:tex_conceal = 'dbmg'
"let g:tex_conceal = ''
"let g:vimtex_latexmk_continuous  = 0
"let g:vimtex_latexmk_background  = 1
"let g:vimtex_imaps_disabled = [']]']
let g:tex_no_error = 1

let g:tex_fold_override_foldtext = 1
let g:tex_fold_additional_envs = [
            \ 'cases',
            \ 'claim',
            \ 'lemma',
            \ 'proof',
            \ 'itemize',
            \ 'theorem',
            \ 'example',
            \ 'corollary',
            \ 'enumerate',
            \ 'definition',
            \ 'tikzpicture']

nnoremap <leader>lv :VimtexView<cr>
nnoremap <leader>lc :VimtexClean<cr>
nnoremap <leader>le :VimtexError<cr>
nnoremap <leader>ll :VimtexCompileToggle<cr>
nnoremap <leader>lt :call ToggleConcealCursor()<cr>

au FileType tex setlocal spell linebreak norelativenumber

if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif

let g:ycm_semantic_triggers.tex = [
            \ 're!\\[A-Za-z]*cite[A-Za-z]*(\[[^]]*\]){0,2}{[^}]*',
            \ 're!\\[A-Za-z]*ref({[^}]*|range{([^,{}]*(}{)?))',
            \ 're!\\hyperref\[[^]]*',
            \ 're!\\includegraphics\*?(\[[^]]*\]){0,2}{[^}]*',
            \ 're!\\(include(only)?|input){[^}]*',
            \ 're!\\\a*(gls|Gls|GLS)(pl)?\a*(\s*\[[^]]*\]){0,2}\s*\{[^}]*',
            \ 're!\\includepdf(\s*\[[^]]*\])?\s*\{[^}]*',
            \ 're!\\includestandalone(\s*\[[^]]*\])?\s*\{[^}]*',
            \ ]

let g:tex_conceal_cursor_toggled = 0
function! ToggleConcealCursor()
    if (&ft=='tex')
        if (g:tex_conceal_cursor_toggled == 0)
            set concealcursor=c
            let g:tex_conceal_cursor_toggled = 1
        else
            set concealcursor=inc
            let g:tex_conceal_cursor_toggled = 0
        endif
    endif
endfunction

" }}}

" Goyo and Limelight {{{
let g:goyo_width = '65%'
let g:limelight_conceal_ctermfg = 240     " Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_guifg = '#777777' " Color name (:help gui-colors) or RGB color
" }}}

" Markdown {{{
let g:vim_markdown_conceal = 0                        " disable conceal
" }}}

" cheatsheet 40 {{{
let g:cheat40_use_default = 0
nnoremap <c-e><c-e> :call EditCheatSheet()<cr>

function! EditCheatSheet()
    botright 45vnew ~/dotfiles/vim-cheatsheet.txt
    setlocal fileencoding=utf-8 filetype=cheat40
    setlocal colorcolumn=25,40 winfixwidth expandtab nonumber norelativenumber nospell nowrap textwidth=40
    nnoremap <silent> <buffer> q :q<cr>
    nnoremap <silent> <buffer> ? :call ShowDefaultCheatSheet()<cr>
endfunction

function! ShowDefaultCheatSheet()
    below sp ~/.vim/plugged/vim-cheat40/cheat40.txt
    setlocal expandtab nonumber norelativenumber nospell nowrap textwidth=40
    setlocal fileencoding=utf-8 filetype=cheat40
    nnoremap <silent> <buffer> q :q<cr>
endfunction
" }}}

" Vimfiler {{{ "
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '*'
" }}} Vimfiler "

" vim:foldmethod=marker:foldlevel=0
