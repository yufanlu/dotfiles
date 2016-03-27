set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim 
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'               " let Vundle manage Vundle, required
Plugin 'mhartington/oceanic-next'           " Color scheme
Plugin 'altercation/vim-colors-solarized'   " 

Plugin 'majutsushi/tagbar'                  " Layout
Plugin 'scrooloose/nerdcommenter'           " 
Plugin 'vim-airline/vim-airline'            " 
Plugin 'vim-airline/vim-airline-themes'     " 

Plugin 'tpope/vim-repeat'                   " Behavior
Plugin 'tpope/vim-surround'                 " 
Plugin 'Raimondi/delimitMate'               " 
Plugin 'terryma/vim-multiple-cursors'       " 

Plugin 'ctrlpvim/ctrlp.vim'                 " File system
Plugin 'scrooloose/nerdtree'                " 

Plugin 'tpope/vim-fugitive'                 " Git
Plugin 'airblade/vim-gitgutter'             " 

Plugin 'scrooloose/syntastic'           
Plugin 'gilligan/vim-lldb'                  " Debugger

Plugin 'OmniSharp/omnisharp-vim'            " OmniSharp
Plugin 'oranget/vim-csharp'                 " 

Plugin 'octol/vim-cpp-enhanced-highlight'   " C++ 
Plugin 'vim-jp/vim-cpp'                     " 
Plugin 'Valloric/YouCompleteMe'             " 
Plugin 'rdnetto/ycm-generator'              " 

Plugin 'vim-latex/vim-latex'                " Latex

Plugin 'hdima/python-syntax'                " Python

Plugin 'krisajenkins/vim-pipe'              " Database
Plugin 'vim-scripts/dbext.vim'

call vundle#end()
filetype plugin indent on

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

" ------------------------------
" keyboard configuration
" ------------------------------
let mapleader = ","
let g:mapleader = ","
nmap <leader>w :w!<cr>
map j gj
map k gk
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <F2> :set nowrap! <cr> 
nmap ,e :NERDTreeToggle<CR>
nnoremap <leader><space> :nohlsearch<CR>

" ------------------------------
" Util configuration
" ------------------------------
set relativenumber 
set number                                  " line number
set ruler                                   " show 'line #', 'col #', etc
set history=700                             " command history
set wrap                                    " Wrap lines
set mouse=a                                 " enable mouse action

" ------------------------------
" Navigation key configuration
" ------------------------------
set backspace=eol,start,indent
set whichwrap+=<,>,h,l  

" ------------------------------
" Search configuration
" ------------------------------
set ignorecase
set smartcase
set hlsearch                                " highlight search
set incsearch                               " incremental search (search as type)

" ------------------------------
" Tab configuration
" ------------------------------
set expandtab
set shiftwidth=4
set tabstop=4
set ai                                      " Auto indent
set si                                      " Smart indent

" ------------------------------
" Status Line configuration
" Plugin: vim-airline
" ------------------------------
set laststatus=2
set encoding=utf-8
"set guifont=Sauce\ Code\ Powerline\ Light:h11
set guifont=Sauce\ Code\ Powerline:h11
set fillchars+=stl:\ ,stlnc:\
let g:airline_powerline_fonts = 1
"let g:airline_theme='solarized'
let g:airline_theme='oceanicnext'
let g:airline#extensions#tabline#enabled = 1     " Enable the list of buffers
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename

" ------------------------------
" Colorscheme configuration
" ------------------------------
syntax enable
set t_Co=256
set background=dark
colorscheme OceanicNext
"let g:solarized_termcolors=256
"colorscheme solarized

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


" ------------------------------
" Tagbar
" Plugin: vim-latex
" ------------------------------
nmap <F8> :TagbarToggle<CR>


" ------------------------------
" You Complete Me
" ------------------------------
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:syntastic_always_populate_loc_list = 1
