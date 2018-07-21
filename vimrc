" ==================================
" vimrc
" ==================================

set nocompatible

" Plugins {{{
call plug#begin('~/.vim/plugged')

" UI
Plug 'chriskempson/base16-vim'
Plug 'whatyouhide/vim-gotham'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'

" Behavior
Plug 'tpope/vim-eunuch'
Plug 'Konfekt/FastFold'
Plug 'tpope/vim-repeat'
Plug 'majutsushi/tagbar'
Plug 'junegunn/vim-slash'
Plug 'mhinz/vim-startify'
Plug 'pbrisbin/vim-mkdir'
Plug 'tpope/vim-surround'
Plug 'Valloric/ListToggle'
Plug 'Raimondi/delimitMate'
Plug 'takac/vim-commandcaps'
Plug 'vim-scripts/matchit.zip'
Plug 'tpope/vim-projectionist'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'ntpeters/vim-better-whitespace'
Plug 'AndrewRadev/sideways.vim'

" Tag
Plug 'jsfaint/gen_tags.vim'

" File system
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Git
Plug 'tpope/vim-fugitive', {'for': ['cpp', 'python']}
Plug 'airblade/vim-gitgutter', {'for': ['cpp', 'python']}

" syntax check
Plug 'w0rp/ale'

Plug 'kassio/neoterm'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Autocomplete
if has('nvim')
  "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  "Plug 'autozimu/LanguageClient-neovim', {'branch': 'next','do': 'bash install.sh'}
  Plug 'ncm2/ncm2'
  Plug 'roxma/nvim-yarp'

  Plug 'ncm2/ncm2-bufword'
  Plug 'ncm2/ncm2-path'
  Plug 'ncm2/ncm2-pyclang', {'for': 'cpp'}
  Plug 'ncm2/ncm2-jedi', {'for': 'python'}
  Plug 'ncm2/ncm2-vim', {'for': 'vim'} | Plug 'Shougo/neco-vim', {'for': 'vim'}
  Plug 'ncm2/ncm2-vim' | Plug 'Shougo/neoinclude.vim'
  Plug 'ncm2/ncm2-syntax' | Plug 'Shougo/neco-syntax'

  Plug 'ncm2/ncm2-ultisnips'
  Plug 'ncm2/ncm2-tagprefix'
else
  Plug 'Valloric/YouCompleteMe', { 'do': 'python3 install.py', 'for': ['python', 'cpp', 'tex', 'vim'] }
endif

Plug 'Shougo/echodoc.vim'

" Debugger and formater
Plug 'Chiel92/vim-autoformat', { 'for': ['cpp', 'python', 'typescript'] }

" C++
Plug 'vim-jp/vim-cpp', {'for': 'cpp'}
Plug 'octol/vim-cpp-enhanced-highlight', {'for': 'cpp'}

" Latex
Plug 'lervag/vimtex', {'for': 'tex'}
Plug 'matze/vim-tex-fold', {'for': 'tex'}

" kdb/q
Plug 'katusk/vim-qkdb-syntax', {'for': 'q'}

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
set nolazyredraw                                " redraw only when we need to.
set noshowmatch                               " np highlight matching [{()}]
set relativenumber
set wildmenu

set guifont=Sauce\ Code\ Powerline:h11        " font face/size
if has('nvim')
    set guicursor=n-v-c-sm:block,i-ci-ve:block,r-cr-o:block
endif

" True Color Support
if (has("termguicolors"))
    set termguicolors
    let NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

" colorscheme
set t_Co=256
set t_ut=

let base16colorspace=256
colorscheme base16-solarized-dark

let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'

" Status Line configuration
syntax enable
set noshowmode
set laststatus=2
set encoding=utf-8
set background=dark
set list
set listchars=tab:▸\ ,eol:¬

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
nmap <leader>e :NERDTreeToggle<cr>
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

set hidden

" Folding
set foldenable                                      " enable folding
set foldnestmax=10                                  " max 10 depth
set foldmethod=syntax                               " fold based on indent level
set foldlevelstart=10                               " start with fold level of 1
nnoremap <space> za                                 " space open/closes folds

" }}}

" Behavior  {{{
inoremap <c-c> <ESC>

set shortmess+=c
set clipboard+=unnamedplus

" Move between windows
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h
nnoremap <c-k> <c-w>k
nnoremap <c-j> <c-w>j

" H & L
vnoremap H ^
vnoremap L $

" Don't go to Ex mode
nnoremap Q <nop>

" Stay in visual after shifting
vmap < <gv
vmap > >gv

" Editing/Loading .vimrc
nnoremap <c-e><c-v> :vs ~/.vimrc<cr>

" Fold All but current
nnoremap <leader>f zMzvzz

if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif
" }}}

let g:loaded_ruby_provider = 1
let g:loaded_python_provider = 1
let g:python3_host_prog = 'python'
"let g:python3_host_prog = '/Users/yufanlu/.pyenv/shims/python'

" vim-Plug
command! PU PlugUpdate | PlugUpgrade
command! PS PlugStatus
command! PC PlugClean

" NERD Tree {{{
let NERDTreeNaturalSort=1
" }}}

" vim-autoformat {{{
noremap <F3> :Autoformat<CR>
" }}}

" Tagbar {{{
nnoremap <F8> :TagbarToggle<cr>
let g:tagbar_previewwin_pos = "aboveleft"
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

" YCM {{{
let g:ycm_python_binary_path = 'python'
let g:ycm_server_python_interpreter = 'python'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_complete_in_comments_and_strings = 1
let g:ycm_autoclose_preview_window_after_insertion  = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_collect_identifiers_from_tags_files = 1

" make YCM compatible with UltiSnips
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']

" YCM semantic trigger
if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif

let g:ycm_semantic_triggers.python = ['.', 're!\w{5}']

" }}}

" NCM2 {{{
augroup MyNCM2
    autocmd!
    " enable ncm2 for all buffers
    autocmd BufEnter * call ncm2#enable_for_buffer()

    " :help Ncm2PopupOpen for more information
    set completeopt=noinsert,menuone,noselect

    " When the <Enter> key is pressed while the popup menu is visible, it only
    " hides the menu. Use this mapping to close the menu and also start a new line.
    inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

    " Use <TAB> to select the popup menu:
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

    " Press enter key to trigger snippet expansion
    " The parameters are the same as `:help feedkeys()`
    inoremap <silent> <expr> <Tab> ncm2_ultisnips#expand_or("\<Tab>", 'n')

    " pyclang config {{{
        " libclang
        let s:clang_library_path='/Library/Developer/CommandLineTools/usr/lib'
        if isdirectory(s:clang_library_path)
            let g:clang_library_path=s:clang_library_path
            let g:ncm2_pyclang#library_path = s:clang_library_path
        endif

        " a list of relative paths for compile_commands.json
        let g:ncm2_pyclang#database_path = ['compile_commands.json', 'build/compile_commands.json']
        autocmd FileType c,cpp nnoremap <buffer> gd :<c-u>call ncm2_pyclang#goto_declaration()<cr>
    " }}}

augroup END
" }}}

" UltiSnips {{{
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsExpandTrigger = "<TAB>"
let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
let g:UltiSnipsEditSplit = "vertical"
nnoremap <c-e><c-u> :UltiSnipsEdit<cr>
" }}}

" FZF {{{
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

" Ale {{{
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {'python': ['flake8'], 'cpp': ['clang'], 'vim': ['vint']}
" }}}

" {{{ FastFold
let g:tex_fold_enabled = 1
let g:fastfold_skip_filetypes = ['taglist', 'Tagbar', 'NERD']
let g:fastfold_fdmhook = 1
" }}}

" vimtex {{{
let g:tex_flavor  = 'latex'
let g:tex_conceal = ''
let g:vimtex_fold_manual = 1
let g:vimtex_latexmk_continuous = 1

let g:vimtex_view_method = 'skim'
let g:vimtex_view_automatic = 1

let g:vimtex_toc_fold = 1
let g:vimtex_format_enabled = 1

if has('nvim')
  let g:vimtex_compiler_progname = 'nvr'
endif

let g:tex_fold_override_foldtext = 1
let g:tex_fold_additional_envs = [
    \ 'proposition',
    \ 'matrix',
    \ 'claim',
    \ 'remark',
    \ 'lemma',
    \ 'theorem',
    \ 'warning',
    \ 'proof',
    \ 'minted',
    \ 'itemize',
    \ 'example',
    \ 'corollary',
    \ 'enumerate']

au FileType tex nnoremap <leader>lv :VimtexView<cr>
au FileType tex nnoremap <leader>lc :VimtexClean<cr>
au FileType tex nnoremap <leader>lC :VimtexClean!<cr>
au FileType tex nnoremap <leader>le :VimtexError<cr>
au FileType tex nnoremap <leader>ll :VimtexCompile<cr>
au FileType tex nnoremap <leader>lt :VimtexTocToggle<cr>

au FileType tex setlocal spell linebreak
au FileType tex setlocal conceallevel=2
au FileType tex let b:delimitMate_quotes="\" '"

let g:vimtex#re#ncm = [
    \ '\\[A-Za-z]*',
    \ '\\[A-Za-z]*cite[A-Za-z]*(\[[^]]*\]){0,2}{[^}]*',
    \ '\\(text|block)cquote\*?(\[[^]]*\]){0,2}{[^}]*',
    \ '\\(for|hy)[A-Za-z]*cquote\*?{[^}]*}(\[[^]]*\]){0,2}{[^}]*',
    \ '\\[A-Za-z]*ref({[^}]*|range{([^,{}]*(}{)?))',
    \ '\\hyperref\[[^]]*',
    \ '\\includegraphics\*?(\[[^]]*\]){0,2}{[^}]*',
    \ '\\(include(only)?|input){[^}]*',
    \ '\\\a*(gls|Gls|GLS)(pl)?\a*(\s*\[[^]]*\]){0,2}\s*\{[^}]*',
    \ '\\includepdf(\s*\[[^]]*\])?\s*\{[^}]*',
    \ '\\includestandalone(\s*\[[^]]*\])?\s*\{[^}]*',
    \ '\\usepackage(\s*\[[^]]*\])?\s*\{[^}]*',
    \ '\\documentclass(\s*\[[^]]*\])?\s*\{[^}]*',
    \]

let g:vimtex#re#youcompleteme = map(copy(g:vimtex#re#ncm), "'re!' . v:val")

let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme

let g:vimtex_compiler_latexmk = {
      \ 'options' : [
      \   '-pdf',
      \   '--shell-escape',
      \   '-verbose',
      \   '-file-line-error',
      \   '-synctex=1',
      \   '-interaction=nonstopmode',
      \ ],
      \}

let g:vimtex_quickfix_latexlog = {'overfull':0,'underfull':0,'packages':{'hyperref':0}}

augroup MyVimtex
  autocmd!
  autocmd User VimtexEventQuit VimtexClean
augroup END
" }}}

" q {{{
augroup MyKDB
  autocmd!
  autocmd BufRead,BufNewFile *.q set filetype=q
augroup END
" }}}

" neoterm {{{
let g:neoterm_repl_python='ipython3 --no-autoindent --matplotlib=auto'
nnoremap <c-e><c-t> :Ttoggle<cr>
nnoremap <c-s> :call SendLineOrClear()<cr>
vnoremap <c-s> :TREPLSendSelection<cr>

" }}}

" echodoc {{{
let g:echodoc_enable_at_startup = 1
" }}}

" sideway {{{
nnoremap H :SidewaysLeft<cr>
nnoremap L :SidewaysRight<cr>
" }}}

" vim:foldmethod=marker:foldlevel=2
