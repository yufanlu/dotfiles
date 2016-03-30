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
Plugin 'tpope/vim-dispatch'                 " OmniSharp

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
Plugin 'fsharp/vim-fsharp'                  " F#

call vundle#end()
filetype plugin indent on
" }}}

" Vim Behavior configuration {{{
" ------------------------------
" Vim Behavior configuration
" ------------------------------
set autoread        " auto reload file
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

" Buffer {{{
" ------------------------------
" Buffer
" ------------------------------
set hidden
nmap \bl :ls<CR>                     " Show all open buffers and their status
nmap \T :enew<cr>                    " To open a new empty buffer
nmap \l :bnext<CR>                   " Move to the next buffer
nmap \p :bprevious<CR>               " Move to the previous buffer
nmap \q :bp <BAR> bd #<CR>          " Close current buffer and move to previous one
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
set noshowmatch                             " np highlight matching [{()}]
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
"let g:airline_theme='gotham256'
"let g:airline_theme='solarized'
let g:airline_theme='oceanicnext'
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
"colorscheme gotham256
colorscheme OceanicNext
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

" OmniSharp {{{
"" ------------------------------
"" OmniSharp
"" ------------------------------
"let g:OmniSharp_selector_ui = 'ctrlp'           " Use ctrlp.vim
""Timeout in seconds to wait for a response from the server
"let g:OmniSharp_timeout = 1
""Set the type lookup function to use the preview window instead of the status line
"let g:OmniSharp_typeLookupInPreview = 1
""Move the preview window (code documentation) to the bottom of the screen, so it doesn't move the code!
""You might also want to look at the echodoc plugin
""set splitbelow
"" Get Code Issues and syntax errors
"let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']
"augroup omnisharp_commands
    "autocmd!

    ""Set autocomplete function to OmniSharp (if not using YouCompleteMe completion plugin)
    "autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

    "" Synchronous build (blocks Vim)
    ""autocmd FileType cs nnoremap <F5> :wa!<cr>:OmniSharpBuild<cr>
    "" Builds can also run asynchronously with vim-dispatch installed
    "autocmd FileType cs nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>
    "" automatic syntax check on events (TextChanged requires Vim 7.4)
    "autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

    "" Automatically add new cs files to the nearest project on save
    "autocmd BufWritePost *.cs call OmniSharp#AddToProject()

    ""show type information automatically when the cursor stops moving
    "autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    ""The following commands are contextual, based on the current cursor position.

    "autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
    "autocmd FileType cs nnoremap <leader>fi :OmniSharpFindImplementations<cr>
    "autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
    "autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
    "autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
    ""finds members in the current buffer
    "autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr>
    "" cursor can be anywhere on the line containing an issue
    "autocmd FileType cs nnoremap <leader>x  :OmniSharpFixIssue<cr>
    "autocmd FileType cs nnoremap <leader>fx :OmniSharpFixUsings<cr>
    "autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
    "autocmd FileType cs nnoremap <leader>dc :OmniSharpDocumentation<cr>
    ""navigate up by method/property/field
    "autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr>
    ""navigate down by method/property/field
    "autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr>

"augroup END

"" this setting controls how long to wait (in ms) before fetching type / symbol information.
"set updatetime=500
"" Remove 'Press Enter to continue' message when type information is longer than one line.
"set cmdheight=2

" }}}

" F# {{{
" ------------------------------
" F#
" ------------------------------
let g:fsharp_xbuild_path = "/usr/local/bin/xbuild"
" }}}
 
" ListToggle {{{
" ------------------------------
" ListToggle
" ------------------------------
" let g:lt_location_list_toggle_map = '<leader>t'
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
