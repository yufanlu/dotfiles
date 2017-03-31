" ==================================
" vimrc
" ==================================

set nocompatible

" Plugins {{{
call plug#begin('~/.vim/plugged')

" UI
Plug 'chriskempson/base16-vim'
Plug 'whatyouhide/vim-gotham'
Plug 'mhartington/oceanic-next'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Behavior
Plug 'Konfekt/FastFold'
Plug 'tpope/vim-repeat'
Plug 'godlygeek/tabular', { 'for': ['pandoc', 'markdown'] }
Plug 'tpope/vim-dispatch', { 'for': ['cpp', 'python'] }
Plug 'majutsushi/tagbar', { 'for': ['cpp', 'python', 'typescript', 'ocaml'] }
"Plug 'mhinz/vim-startify'
Plug 'pbrisbin/vim-mkdir'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine', { 'for': ['cpp', 'python', 'typescript', 'ocaml'] }
Plug 'Raimondi/delimitMate'
"Plug 'jiangmiao/auto-pairs'
"Plug 'kshenoy/vim-signature'
Plug 'takac/vim-commandcaps'
Plug 'lifepillar/vim-cheat40'
Plug 'vim-scripts/matchit.zip'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'ntpeters/vim-better-whitespace'
Plug 'easymotion/vim-easymotion', { 'for': ['pandoc', 'markdown', 'tex']}

" Tag
Plug 'ludovicchabant/vim-gutentags'

" Search
"Plug 'mileszs/ack.vim'

" File system
Plug 'Shougo/vimfiler.vim', { 'on': 'VimFilerExplorer' }

" Unite and related plugins
Plug 'Shougo/unite.vim'
"Plug 'Shougo/unite-outline', { 'for': ['pandoc', 'markdown'] }

" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Git
"Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" static syntax check
Plug 'scrooloose/syntastic', { 'for': ['cpp', 'typescript', 'ocaml', 'python'] }

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Autocomplete
Plug 'Valloric/YouCompleteMe', { 'do': 'python3 install.py --clang-completer', 'for': ['cpp', 'python', 'tex', 'typescript', 'ocaml'] }

" Asynchronous
"Plug 'Shougo/vimproc.vim', { 'do': 'make' }

" Writing
Plug 'reedes/vim-pencil', {'for':['markdown', 'pandoc']}
Plug 'junegunn/goyo.vim', {'for':['markdown', 'pandoc']}
Plug 'kannokanno/previm', {'for': 'markdown'}
Plug 'tyru/open-browser.vim', {'for': 'markdown'}
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'dhruvasagar/vim-table-mode', {'for': 'markdown'}
Plug 'vim-pandoc/vim-pandoc', {'for': ['pandoc', 'rmarkdown']}
Plug 'vim-pandoc/vim-pandoc-syntax' , {'for': ['pandoc', 'rmarkdown']}
Plug 'vim-pandoc/vim-rmarkdown', {'for': 'rmarkdown'}

" Debugger and formater
Plug 'Chiel92/vim-autoformat', { 'for': ['cpp', 'python', 'typescript', 'ocaml'] }

" C++
Plug 'vim-jp/vim-cpp', {'for': 'cpp'}
Plug 'octol/vim-cpp-enhanced-highlight', {'for': 'cpp'}
Plug 'jeaye/color_coded', { 'do': 'cmake . && make && make install', 'for': 'cpp'}

" Ocaml
Plug '~/.opam/system/share/merlin', {'rtp': 'vim', 'for': 'ocaml'}
Plug '~/.opam/system/share/ocp-indent', {'rtp': 'vim', 'for': 'ocaml'}
Plug 'rgrinberg/vim-ocaml', {'for': 'ocaml'}

" Latex
Plug 'lervag/vimtex', {'for': 'tex' }
Plug 'matze/vim-tex-fold', {'for': 'tex' }

" Python
Plug 'tmhedberg/SimpylFold', {'for': 'python'}
"Plug 'hdima/python-syntax', {'for': 'python'}
Plug 'vim-python/python-syntax', {'for': 'python'}

" Web Dev
Plug 'mattn/emmet-vim', {'for': 'html'}
"Plug 'groenewege/vim-less', {'for': 'less'}

" Typescript
Plug 'HerringtonDarkholme/yats.vim', {'for': 'typescript'}
Plug 'leafgarland/typescript-vim', {'for': 'typescript'}

" Build System
Plug 'vhdirk/vim-cmake', {'for': 'cpp'}

" OmniSharp
"Plug 'OmniSharp/omnisharp-vim'

" plugins to learn
Plug 'ledger/vim-ledger', {'for': 'ledger'}

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
set wildmenu
"set guifont=Sauce\ Code\ Powerline\ Light:h11
set guifont=Sauce\ Code\ Powerline:h11        " font face/size

" colorscheme
set t_Co=256

" Go to Gotham when it's really late
if strftime("%H") < 22
    let base16colorspace=256
    colorscheme base16-oceanicnext
    let g:airline_theme='oceanicnext'
else
    colorscheme gotham
    let g:airline_theme='gotham'
endif

" turn off scroll bar if using MacVim
if has("gui_running")
   set linespace=1
   set guioptions=gm
   set fuoptions=maxvert,maxhorz
endif

" Status Line configuration
syntax enable
set noshowmode
set laststatus=2
set encoding=utf-8
set background=dark
set fillchars+=stl:\ ,stlnc:\

" True Color Support
if (has("termguicolors"))
    set termguicolors
endif
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
nnoremap <c-h> g0
nnoremap <c-l> g$
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
set shiftwidth=4
set expandtab
set cindent
"set cinoptions+=L0
set cinoptions+=g0

" buffer
set hidden
nnoremap <c-e><c-n> :bn<CR>
nnoremap <c-e><c-p> :bN<CR>

" Folding
set foldenable                                      " enable folding
set foldnestmax=10                                  " max 10 depth
set foldmethod=syntax                               " fold based on indent level
set foldlevelstart=10                               " start with fold level of 1
nnoremap <space> za                                 " space open/closes folds

" Python Host Prog Setting
let g:python_host_prog = '/usr/local/bin/python3'

" }}}

" Behavior  {{{

" H & L
vnoremap H ^
vnoremap L $

" Don't go to Ex mode
nnoremap Q <nop>

" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" Stay in visual after shifting
vmap < <gv
vmap > >gv

" F5 to compile
map <F5> :Make<cr>

" Editing/Loading .vimrc
nnoremap <c-e><c-v> :vs ~/.vimrc<cr>
nnoremap <c-e><c-l> :so ~/.vimrc<cr>

" Fold All but current
nnoremap <leader>f zMzvzz
" }}}

" vim-Plug {{{
command! PU PlugUpdate | PlugUpgrade
command! PC PlugClean
" }}}

" Tagbar {{{
nnoremap <F8> :TagbarToggle<cr>
nnoremap <c-e><c-o> :TagbarToggle<cr>
let g:tagbar_previewwin_pos = "aboveleft"
let g:tagbar_width = 50
let g:tagbar_show_linenumbers = 2   " show relativenumber in the tagbar
" }}}

" vim-airline {{{
let g:airline_powerline_fonts = 1
let g:airline_left_sep  = ''
let g:airline_right_sep = ''

" tabline
"let g:airline#extensions#tabline#enabled = 1
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
"nnoremap <c-e><c-p> :Unite -start-insert file_rec/async<cr>
"nnoremap <c-e><c-b> :Unite -winheight=15 buffer bookmark<cr>
"nnoremap <c-e><c-o> :Unite -vertical -direction=botright -winwidth=45 outline<cr>
" }}}

" Syntastic {{{
let g:syntastic_python_python_exec = 'python3'
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_tex_checkers = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_ocaml_checkers = ['merlin']
"let g:syntastic_error_symbol='✗'
"let g:syntastic_warning_symbol='⚠'
"let g:syntastic_style_error_symbol = '✗'
"let g:syntastic_style_warning_symbol = '⚠'
"let g:syntastic_auto_loc_list=1
"let g:syntastic_aggregate_errors = 1
" }}}

" YCM and UltiSnips {{{
let g:ycm_python_binary_path = '/usr/local/bin/python3'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_complete_in_comments_and_strings = 1
let g:ycm_autoclose_preview_window_after_insertion  = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_collect_identifiers_from_tags_files = 1
"set omnifunc=syntaxcomplete#Complete

" make YCM compatible with UltiSnips
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']

" key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<TAB>"
let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

let g:UltiSnipsEditSplit = "vertical"
nnoremap <c-e><c-u> :UltiSnipsEdit<cr>

" libclang
let s:clang_library_path='/Library/Developer/CommandLineTools/usr/lib'
if isdirectory(s:clang_library_path)
    let g:clang_library_path=s:clang_library_path
endif
" }}}

" delimitMate {{{
"au FileType tex let b:loaded_delimitMate = 0
" }}}

" AutoPair {{{
"let g:AutoPairsShortcutJump = '<S-Tab>'
" }}}

" python-syntax {{{
let python_highlight_all = 1
" }}}

" vimtex {{{
let g:tex_flavor  = 'latex'
let g:tex_conceal = 'dbmg'
"let g:tex_conceal = ''
let g:vimtex_latexmk_continuous = 1
"let g:vimtex_latexmk_background  = 1
let g:tex_no_error = 1
let g:vimtex_fold_manual = 1

let g:tex_fold_override_foldtext = 1
let g:tex_fold_additional_envs = [
            \ 'center',
            \ 'equation',
            \ 'proposition',
            \ 'chapter',
            \ 'matrix',
            \ 'note',
            \ 'cases',
            \ 'claim',
            \ 'remark',
            \ 'lemma',
            \ 'proof',
            \ 'itemize',
            \ 'theorem',
            \ 'example',
            \ 'corollary',
            \ 'enumerate',
            \ 'definition']

nnoremap <leader>lv :VimtexView<cr>
nnoremap <leader>lc :VimtexClean<cr>
nnoremap <leader>lC :VimtexClean!<cr>
nnoremap <leader>le :VimtexError<cr>
nnoremap <leader>ll :VimtexCompile<cr>
nnoremap <leader>lt :VimtexTocToggle<cr>

au FileType tex setlocal spell linebreak "norelativenumber
au FileType tex setlocal conceallevel=2
au FileType tex let b:delimitMate_quotes="\" '"

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

let g:vimtex_quickfix_latexlog = {
            \ 'overfull' : 0,
            \ 'underfull' : 0,
            \ 'packages' : {
            \   'hyperref' : 0,
            \ },
            \}

augroup MyVimtex
  autocmd!
  autocmd User VimtexEventQuit VimtexClean
augroup END

" }}}

" FZF {{{
nnoremap <c-b> :Buffer<cr>
nnoremap <c-f> :Lines<cr>
nnoremap <c-p> :Ag<cr>


let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Insert mode completion
imap <c-x><c-l> <plug>(fzf-complete-line)

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
" }}}

" Goyo and Limelight {{{
let g:goyo_width = '65%'
let g:limelight_conceal_ctermfg = 240     " Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_guifg = '#777777' " Color name (:help gui-colors) or RGB color
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

" Vimfiler {{{
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '*'
" " }}}}}

" vim-autoformat {{{
noremap <F3> :Autoformat<CR>
let g:formatdef_google_style_cpp = '"clang-format --style=''{BasedOnStyle: Google, IndentWidth: 4, AccessModifierOffset: -4}''"'
let g:formatters_cpp = ['google_style_cpp']
let g:formatdef_ocp_indent_auto_formatter = '"ocp-indent"'
let g:formatters_ocaml = ['ocp_indent_auto_formatter']
" }}}  "

" {{{ FastFold
let g:tex_fold_enabled = 1
" }}}

" pandoc {{{
let g:pandoc#folding#fdc = 0
let g:pandoc#formatting#equalprg = ''
let g:pandoc#filetypes#pandoc_markdown = 0
au BufRead,BufNewFile *.pdc set filetype=pandoc
au FileType pandoc let b:delimitMate_quotes="\" '"
au FileType pandoc setlocal nonumber norelativenumber
"let g:pandoc#modules#disabled = ["folding"]
" }}}

" Custom functions {{{

" Create Build Dir {{{
function! CreateBuildDir()
    if !isdirectory('build')
        call mkdir('build')
        echo 'build directory created'
    else
        echo 'build directory already exists'
    endif
endfunction

command! CreateBuildDir call CreateBuildDir()
" }}}

" Change colorscheme {{{
function! UseGotham()
    colorscheme gotham256
    AirlineTheme gotham256
endfunction

function! UseOceanic()
    colorscheme base16-oceanicnext
    AirlineTheme oceanicnext
endfunction

command! Gotham call UseGotham()
command! Oceanic call UseOceanic()
" }}}

" Toggle Conceal Cursor {{{
let g:conceal_cursor_toggled = 0

function! ToggleConcealCursor()
    if (&ft=='tex'||&ft=='pandoc')
        if (g:conceal_cursor_toggled == 0)
            set concealcursor=c
            let g:conceal_cursor_toggled = 1
        else
            set concealcursor=inc
            let g:conceal_cursor_toggled = 0
        endif
    endif
endfunction

command! ToggleCursor call ToggleConcealCursor()
" }}}

" }}}

" }}}

au FileType cpp command! GetCMakeFile vs CMakeLists.txt

" vim:foldmethod=marker:foldlevel=0
