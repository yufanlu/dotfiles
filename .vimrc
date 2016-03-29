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
"Plugin 'Valloric/ListToggle'                " 
Plugin 'vim-airline/vim-airline'            " 
Plugin 'scrooloose/nerdcommenter'           " 
Plugin 'vim-airline/vim-airline-themes'     " 

Plugin 'tpope/vim-repeat'                   " Behavior
Plugin 'godlygeek/tabular'                  " 
Plugin 'tpope/vim-surround'                 " 
Plugin 'Raimondi/delimitMate'               " 
Plugin 'kshenoy/vim-signature'              " 
Plugin 'vim-scripts/matchit.zip'            " 
Plugin 'terryma/vim-multiple-cursors'       " 


Plugin 'ctrlpvim/ctrlp.vim'                 " File system
Plugin 'scrooloose/nerdtree'                " 

Plugin 'tpope/vim-fugitive'                 " Git
Plugin 'airblade/vim-gitgutter'             " 

Plugin 'scrooloose/syntastic'               " static syntax check 

Plugin 'OmniSharp/omnisharp-vim'            " OmniSharp

Plugin 'SirVer/ultisnips'                   " Snippets
Plugin 'honza/vim-snippets'                 " 

Plugin 'octol/vim-cpp-enhanced-highlight'   " C++ 
Plugin 'vim-jp/vim-cpp'                     " 
Plugin 'Valloric/YouCompleteMe'             " 
Plugin 'rdnetto/ycm-generator'              " 

Plugin 'oranget/vim-csharp'                 " C#
Plugin 'vim-latex/vim-latex'                " Latex
Plugin 'hdima/python-syntax'                " Python
Plugin 'krisajenkins/vim-pipe'              " Database
Plugin 'vim-scripts/dbext.vim'

call vundle#end()
filetype plugin indent on
" }}}

" Vim Behavior configuration {{{
" ------------------------------
" Vim Behavior configuration
" ------------------------------
set autoread        " auto reload file

" ------------------------------
" Buffer
" ------------------------------
set hidden
nmap <leader>bl :ls<CR>                     " Show all open buffers and their status
nmap <leader>T :enew<cr>                    " To open a new empty buffer
nmap <leader>l :bnext<CR>                   " Move to the next buffer
nmap <leader>h :bprevious<CR>               " Move to the previous buffer
nmap <leader>bq :bp <BAR> bd #<CR>          " Close current buffer and move to previous one
nmap <leader>bl :ls<CR>                     " Show all open buffers and their status
" }}}

" keyboard configuration {{{
" ------------------------------
" keyboard configuration
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
" }}}

" Util configuration {{{
" ------------------------------
" Util configuration
" ------------------------------
set wrap                                    " Wrap lines
set ruler                                   " show 'line #', 'col #', etc
set number                                  " line number
set mouse=a                                 " enable mouse action
set history=700                             " command history
set showcmd                                 " show command in bottom bar
"set cursorline                              " highlight current line
set lazyredraw                              " redraw only when we need to.
set showmatch                               " highlight matching [{()}]
set relativenumber 
"set guifont=Sauce\ Code\ Powerline\ Light:h11
set guifont=Sauce\ Code\ Powerline:h11
" }}}

" Folding {{{
" ------------------------------
" Folding
" ------------------------------
set foldenable                              " enable folding
set foldnestmax=10                          " max 10 depth
set foldmethod=indent                       " fold based on indent level
set foldlevelstart=10                       " start with fold level of 1
nnoremap <space> za                         " space open/closes folds
" }}}

" Navigation key configuration {{{
" ------------------------------
" Navigation key configuration
" ------------------------------
set backspace=eol,start,indent
set whichwrap+=<,>,h,l  
" }}}

" Search configuration {{{
" ------------------------------
" Search configuration
" ------------------------------
set ignorecase
set smartcase
set hlsearch                                " highlight search
set incsearch                               " incremental search (search as type)
" }}}

" Tab and Indent configuration {{{
" ------------------------------
" Tab and Indent configuration
" ------------------------------
set ai                                      " Auto indent
set si                                      " Smart indent
set tabstop=4
set expandtab
set shiftwidth=4
" }}}

" Status Line configuration {{{
" ------------------------------
" Status Line configuration
" Plugin: vim-airline
" ------------------------------
set laststatus=2
set encoding=utf-8
set fillchars+=stl:\ ,stlnc:\
let g:airline_powerline_fonts = 1
let g:airline_theme='gotham256'
"let g:airline_theme='solarized'
"let g:airline_theme='oceanicnext'
let g:airline#extensions#tabline#enabled   = 1     " Enable the list of buffers
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tagbar#enabled    = 1
let g:airline#extensions#tabline#fnamemod  = ':t'  " Show just the filename
" }}}

" Colorscheme configuration {{{
" ------------------------------
" Colorscheme configuration
" ------------------------------
syntax enable
set t_Co=256
set background=dark
colorscheme gotham256
"colorscheme OceanicNext
"let g:solarized_termcolors=256
"colorscheme solarized
" }}}

" Latex configuration {{{
" ------------------------------
" Latex configuration
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
" }}}

" Tagbar {{{
" ------------------------------
" Tagbar
" Plugin: tagbar
" ------------------------------
nmap <F8> :TagbarToggle<CR>
" }}}

" You Complete Me {{{
" ------------------------------
" You Complete Me
" ------------------------------
let g:ycm_python_binary_path = '/usr/local/bin/python'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:syntastic_always_populate_loc_list = 1
" }}}

" ListToggle {{{
" ------------------------------
" ListToggle
" ------------------------------
let g:lt_location_list_toggle_map = '<leader>t'
" let g:lt_quickfix_list_toggle_map = '<leader>q'
" }}}

" Customize function {{{
" ------------------------------
" Customize function
" ------------------------------
function! NightMode()
    colorscheme gotham256
    AirlineTheme gotham256
endfunction

function! DayMode()
    colorscheme oceanicnext
    AirlineTheme oceanicnext
endfunction
" }}}

" vim:foldmethod=marker:foldlevel=0
