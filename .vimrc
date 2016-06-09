" ==================================
" vimrc
" by Yufan Lu
" ==================================

set nocompatible

" Plugins {{{
call plug#begin('~/.vim/plugged')

" UI
Plug 'whatyouhide/vim-gotham'
Plug 'mhartington/oceanic-next'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Behavior
Plug 'tpope/vim-repeat'
Plug 'majutsushi/tagbar'
"Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'Raimondi/delimitMate'
Plug 'kshenoy/vim-signature'
Plug 'takac/vim-commandcaps'
Plug 'vim-scripts/matchit.zip'
Plug 'scrooloose/nerdcommenter'
"Plug 'dhruvasagar/vim-table-mode'
Plug 'terryma/vim-multiple-cursors'
Plug 'ntpeters/vim-better-whitespace'

" Search
Plug 'mileszs/ack.vim'
Plug 'haya14busa/incsearch.vim'

" File system
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Fuzzy Search
Plug 'Shougo/unite.vim'
Plug 'Shougo/unite-outline'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" static syntax check
Plug 'scrooloose/syntastic'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Autocomplete
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }

" Asynchronous
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

" Writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

"Plug 'krisajenkins/vim-pipe'                      " Database
"Plug 'vim-scripts/dbext.vim'                      "

""Plug 'fsharp/vim-fsharp'                         " F#
""Plug 'oranget/vim-csharp'                        " C#
""Plug 'OmniSharp/omnisharp-vim'                   " OmniSharp

" Languages {{{
Plug 'sheerun/vim-polyglot'

" C++
Plug 'vim-jp/vim-cpp', {'for': 'cpp'}
Plug 'octol/vim-cpp-enhanced-highlight', {'for': 'cpp'}

" Latex
"Plug 'vim-latex/vim-latex', {'for': 'tex'}
Plug 'lervag/vimtex', {'for': 'tex'}
Plug 'matze/vim-tex-fold', {'for': 'tex' } "{{{
let g:tex_fold_additional_envs = ['tikzpicture']
"}}}

" Python
Plug 'hdima/python-syntax' , {'for': 'python'}
Plug 'tmhedberg/SimpylFold', {'for': 'python'}
Plug 'davidhalter/jedi-vim', {'for': 'python'}

" Html
Plug 'mattn/emmet-vim', {'for': 'html'}
" }}}

" new plugins
"Plug 'reedes/vim-wordy'
Plug 'ledger/vim-ledger'

call plug#end()

syntax on
filetype plugin indent on
" }}}

" UI configuration {{{
set wrap                                            " Wrap lines
set ruler                                           " show 'line #', 'col #', etc
set number                                          " line number
set mouse=a                                         " enable mouse action
set history=200                                     " command history
set showcmd                                         " show command in bottom bar
set lazyredraw                                      " redraw only when we need to.
set noshowmatch                                     " np highlight matching [{()}]
set relativenumber
set guifont=Sauce\ Code\ Powerline\ Light:h11       " font face/size
"set guifont=Sauce\ Code\ Powerline:h11

"colorscheme gotham256                              " colorscheme
colorscheme OceanicNext
"let g:solarized_termcolors=256
"colorscheme solarized

" turn off scroll bar if using MacVim
if has("gui_running")
   set fuoptions=maxvert,maxhorz
   set guioptions=gm
end

" Status Line configuration
set t_Co=256
syntax enable
set laststatus=2
set encoding=utf-8
set background=dark
set fillchars+=stl:\ ,stlnc:\
" }}}

" General Config {{{

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

nmap <F2> :set nowrap! <CR>
nmap <C-s> :w!<CR>
nmap <leader>w :w!<CR>
nmap <leader>e :NERDTreeToggle<CR>
nnoremap <leader><space> :nohlsearch<CR>

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
set foldmethod=indent                               " fold based on indent level
set foldlevelstart=10                               " start with fold level of 1
nnoremap <space> za                                 " space open/closes folds

" }}}

" Tagbar {{{
nmap <F8> :TagbarToggle<CR>
" }}}

" vim-airline {{{
let g:airline_powerline_fonts = 1
"let g:airline_theme='gotham256'
"let g:airline_theme='solarized'
let g:airline_theme='oceanicnext'

let g:airline_extensions = ['tabline', 'branch', 'hunks', 'syntastic', 'tagbar', 'quickfix', 'ycm']
let g:airline_left_sep  = ''
let g:airline_right_sep = ''

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
nnoremap <C-b> :Unite -winheight=15 buffer<CR>
nnoremap <C-p> :Unite -start-insert -direction=belowright file_rec/async<CR>
nnoremap <C-f> :Unite -start-insert -direction=belowright grep:.<CR>
let g:unite_source_grep_command = 'ag'
" }}}

" Fugitive {{{
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>gr :Gremove<CR>
"autocmd BufReadPost fugitive://* set bufhidden=delete
" }}}

" YCM {{{
let g:ycm_python_binary_path    = '/usr/bin/python'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:syntastic_always_populate_loc_list   = 1
let g:ycm_complete_in_comments_and_strings = 1
"let g:ycm_autoclose_preview_window_after_insertion  = 1
"let g:ycm_autoclose_preview_window_after_completion = 1

set omnifunc=syntaxcomplete#Complete
let g:ycm_filetype_specific_completion_to_disable = {
\  'tex': 1,
\  'gitcommit': 1
\}

" make YCM compatible with UltiSnips
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

" key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger="<TAB>"
let g:UltiSnipsJumpForwardTrigger  = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"
" }}}

"" vim-Latex {{{
"set shellslash
"set grepprg=grep\ -nH\ $*
"let g:tex_flavor='latex'
"let g:Tex_DefaultTargetFormat='pdf'
"let g:Tex_TreatMacViewerAsUNIX = 1
"let g:Tex_ViewRule_pdf = 'open -a /Applications/Preview.app'
""autocmd filetype tex call IMAP ('BB', "\{\\bf <++>\}<++>", "tex")

"" fix auto-indent conflict introduced by YCM
"if exists("g:loaded_fix_indentkeys")
   "finish
"endif

"let g:loaded_fix_indentkeys = 1

"" You may add more filetypes if necessary.
"autocmd FileType tex,plaintex execute "setlocal indentkeys=" . &indentkeys
"" }}}

" vimtex {{{
"let g:vimtex_fold_enabled = 1
inoremap <silent> __ __<c-r>=UltiSnips#Anon('_{$1}$0', '__', '', 'i')<cr>
inoremap <silent> ^^ ^^<c-r>=UltiSnips#Anon('^{$1}$0', '^^', '', 'i')<cr>
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
" }}}

" Goyo and Limelight {{{
let g:goyo_width = '65%'
let g:limelight_conceal_ctermfg = 240     " Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_guifg = '#777777' " Color name (:help gui-colors) or RGB color
" }}}

" Customize function {{{
" ------------------------------
function! NightMode()
    colorscheme gotham256
    AirlineTheme gotham256
endfunction

function! DayMode()
    colorscheme oceanicnext
    AirlineTheme oceanicnext
endfunction
" ------------------------------
" }}}

" vim:foldmethod=marker:foldlevel=0
