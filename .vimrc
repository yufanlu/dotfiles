" ==================================
" vimrc
" by Yufan Lu
" ==================================

" Plugins {{{
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim 
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'               " let Vundle manage Vundle, required

Plugin 'whatyouhide/vim-gotham'             " Color scheme
Plugin 'mhartington/oceanic-next'           " 
Plugin 'altercation/vim-colors-solarized'   " 

Plugin 'majutsushi/tagbar'                  " Layout
Plugin 'vim-airline/vim-airline'            " 
Plugin 'scrooloose/nerdcommenter'           " 
Plugin 'vim-airline/vim-airline-themes'     " 

Plugin 'tpope/vim-repeat'                   " Behavior
Plugin 'godlygeek/tabular'                  " 
Plugin 'tpope/vim-surround'                 " 
Plugin 'Raimondi/delimitMate'               " 
Plugin 'kshenoy/vim-signature'              " toggle marks
Plugin 'vim-scripts/matchit.zip'            " 
Plugin 'terryma/vim-multiple-cursors'       " 
Plugin 'ervandew/supertab'

Plugin 'ctrlpvim/ctrlp.vim'                 " File system
Plugin 'scrooloose/nerdtree'                " 

Plugin 'tpope/vim-fugitive'                 " Git
Plugin 'airblade/vim-gitgutter'             " 

Plugin 'scrooloose/syntastic'               " static syntax check 

Plugin 'SirVer/ultisnips'                   " Snippets
Plugin 'honza/vim-snippets'                 " 

Plugin 'Valloric/YouCompleteMe'             " Autocomplete
Plugin 'tpope/vim-dispatch'                 " 

Plugin 'octol/vim-cpp-enhanced-highlight'   " C++ 
Plugin 'vim-jp/vim-cpp'                     " 

Plugin 'vim-latex/vim-latex'                " Latex
Plugin 'hdima/python-syntax'                " Python
Plugin 'davidhalter/jedi-vim'               " 
Plugin 'Yggdroot/indentLine'                " 

Plugin 'krisajenkins/vim-pipe'              " Database
Plugin 'vim-scripts/dbext.vim'              " 

"Plugin 'fsharp/vim-fsharp'                  " F#
"Plugin 'oranget/vim-csharp'                 " C#
"Plugin 'OmniSharp/omnisharp-vim'            " OmniSharp

Plugin 'sheerun/vim-polyglot'               " Languages syntax packages
Plugin 'xuhdev/SingleCompile'               " Compile single source file

Plugin 'dhruvasagar/vim-table-mode'         " table mode

call vundle#end()
filetype plugin indent on
" }}}

" Vim Behavior configuration {{{
" ------------------------------
set autoread        " auto reload file
" ------------------------------
" }}}

" keyboard configuration {{{
" ------------------------------
let mapleader   = ","
let g:mapleader = ","
map j gj
map k gk
map <F2> :set nowrap! <CR> 
nmap <C-s> :w!<CR>
nmap <leader>w :w!<CR>
nmap <leader>e :NERDTreeToggle<CR>
nnoremap <leader><space> :nohlsearch<CR>
" ------------------------------
" }}}

" Buffer {{{
" ------------------------------
set hidden
nmap \bl :ls<CR>                     " Show all open buffers and their status
nmap \T :enew<CR>                    " To open a new empty buffer
nmap \l :bnext<CR>                   " Move to the next buffer
nmap \p :bprevious<CR>               " Move to the previous buffer
nmap \q :bp <BAR> bd #<CR>          " Close current buffer and move to previous one
" ------------------------------
" }}}

" UI configuration {{{
" ------------------------------
set wrap                                    " Wrap lines
set ruler                                   " show 'line #', 'col #', etc
set number                                  " line number
set mouse=a                                 " enable mouse action
set history=200                             " command history
set showcmd                                 " show command in bottom bar
set lazyredraw                              " redraw only when we need to.
set noshowmatch                             " np highlight matching [{()}]
set relativenumber 
"set guifont=Sauce\ Code\ Powerline\ Light:h11
set guifont=Sauce\ Code\ Powerline:h11
" ------------------------------
" }}}

" Folding {{{
" ------------------------------
set foldenable                              " enable folding
set foldnestmax=10                          " max 10 depth
set foldmethod=indent                       " fold based on indent level
set foldlevelstart=10                       " start with fold level of 1
nnoremap <space> za                         " space open/closes folds
" ------------------------------
" }}}

" Navigation key configuration {{{
" ------------------------------
set backspace=eol,start,indent
set whichwrap+=<,>,h,l  
" ------------------------------
" }}}

" Search configuration {{{
" ------------------------------
set ignorecase
set smartcase
set hlsearch                                " highlight search
set incsearch                               " incremental search (search as type)
" ------------------------------
" }}}

" Tab and Indent configuration {{{
" ------------------------------
set ai                                      " Auto indent
set si                                      " Smart indent
set tabstop=4
set expandtab
set shiftwidth=4
" ------------------------------
" }}}

" Status Line configuration {{{
" ------------------------------
" Plugin: vim-airline
" ------------------------------
set laststatus=2
set encoding=utf-8
set fillchars+=stl:\ ,stlnc:\
let g:airline_powerline_fonts = 1
"let g:airline_theme='gotham256'
"let g:airline_theme='solarized'
let g:airline_theme='oceanicnext'
let g:airline#extensions#tabline#enabled   = 1     " Enable the list of buffers
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tagbar#enabled    = 1
let g:airline#extensions#tabline#fnamemod  = ':t'  " Show just the filename
" ------------------------------
" }}}

" Colorscheme configuration {{{
" ------------------------------
syntax enable
set t_Co=256
set background=dark
"colorscheme gotham256
colorscheme OceanicNext
"let g:solarized_termcolors=256
"colorscheme solarized
" ------------------------------
" }}}

" Latex configuration {{{
" ------------------------------
" Plugin: vim-latex
" ------------------------------
set shellslash
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_TreatMacViewerAsUNIX = 1
"let g:Tex_CompileRule_pdf = 'pdflatex -interaction=nonstopmode $*'
let g:Tex_ViewRule_pdf = 'open -a /Applications/Preview.app'
autocmd filetype tex call IMAP ('BB', "\{\\bf <++>\}<++>", "tex")
" ------------------------------
" }}}

" Tagbar {{{
" ------------------------------
nmap <F8> :TagbarToggle<CR>
" ------------------------------
" }}}

" You Complete Me {{{
" ------------------------------
let g:ycm_python_binary_path = '/usr/bin/python'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:syntastic_always_populate_loc_list = 1
" ------------------------------
" }}}
 
" SuperTab {{{
" ------------------------------
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
"let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsExpandTrigger="<TAB>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" ------------------------------
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

" Customize Key binding {{{
" ------------------------------
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
" ------------------------------
" }}}

" vim:foldmethod=marker:foldlevel=0
