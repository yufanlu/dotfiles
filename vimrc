" =================================
" vimrc by Bruce Lu
" ==================================

" Config Variables {{{
let g:skip_loading_mswin = 1
let b:use_lsp = has('nvim') ? 1 : 0
let b:complete_backend = has('nvim') ? 'ncm2' : 'ycmd'

let g:nvim_plugged_folder = '~/.vim/plugged'

" disable python2, ruby providers
let g:loaded_ruby_provider = 1
let g:loaded_node_provider = 1
let g:loaded_python_provider = 1
let g:python3_host_prog = 'python'


" Plugins {{{
call plug#begin(g:nvim_plugged_folder)

" Eye-candy
Plug 'whatyouhide/vim-gotham'
Plug 'chriskempson/base16-vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'mhinz/vim-startify'

" Better behavior
Plug 'Konfekt/FastFold'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'
Plug 'wellle/targets.vim'
Plug 'airblade/vim-rooter'
Plug 'vim-scripts/matchit.zip'
Plug 'AndrewRadev/sideways.vim'

Plug 'junegunn/vim-slash'
Plug 'Raimondi/delimitMate'

Plug 't9md/vim-choosewin'
Plug 'Valloric/ListToggle'

Plug 'tpope/vim-commentary'
Plug 'terryma/vim-multiple-cursors'

" Fuzzy finder
" Plug 'Shougo/denite.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'bash install --all' }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'

" Better visual guides
Plug 'Yggdroot/indentLine'
Plug 'ntpeters/vim-better-whitespace'

" Utilities & Commands
Plug 'tpope/vim-eunuch'
Plug 'pbrisbin/vim-mkdir'
Plug 'takac/vim-commandcaps'

" Tag & Tagbar
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'

" File system
Plug 'scrooloose/nerdtree' ", {'on': 'NERDTreeToggle'}

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" terminal
Plug 'kassio/neoterm'

" Snippets & Autocomplete
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Shougo/echodoc.vim'

Plug 'w0rp/ale'
Plug 'Chiel92/vim-autoformat'

if get(b:, 'complete_backend', 'ycmd') ==? 'ycmd'
    Plug 'Valloric/YouCompleteMe', {'do': 'python install.py --clang-completer --msvc 15'}
else
    Plug 'Shougo/neco-vim', {'for': 'vim'}

    if get(b:, 'complete_backend', 'ycmd') ==? 'deoplete'
        Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
        if !get(b:, 'use_lsp', 0)
            Plug 'zchee/deoplete-jedi', {'for': 'python'}
        endif
    endif

    if get(b:, 'complete_backend', 'ycmd') ==? 'ncm2'
        Plug 'ncm2/ncm2' | Plug 'roxma/nvim-yarp'
        Plug 'ncm2/ncm2-bufword'
        Plug 'ncm2/ncm2-path'
        Plug 'ncm2/ncm2-ultisnips'
        Plug 'ncm2/ncm2-tagprefix'
        Plug 'ncm2/ncm2-vim', {'for': 'vim'}

        if !get(b:, 'use_lsp', 0)
            Plug 'ncm2/ncm2-jedi', {'for': 'python'}
        endif

        " include them when figuring out how to use ncm2 for cpp
        " Plug 'ncm2/ncm2-neoinclude' | Plug 'Shougo/neoinclude.vim'
        " Plug 'ncm2/ncm2-syntax' | Plug 'Shougo/neco-syntax'
        " Plug 'ncm2/ncm2-pyclang'
    endif

    if get(b:, 'use_lsp', 0)
        Plug 'autozimu/LanguageClient-neovim', {
            \ 'branch': 'next',
            \ 'do': 'powershell -executionpolicy bypass -File install.ps1'
            \ }
    endif

endif

Plug 'chrisbra/csv.vim'

" Latex
Plug 'lervag/vimtex'

" Python
Plug 'tmhedberg/SimpylFold', {'for': 'python'}
Plug 'tweekmonster/braceless.vim', {'for': 'python'}
Plug 'jeetsukumaran/vim-pythonsense', {'for': 'python'}

if has('nvim')
    Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
else
    Plug 'vim-python/python-syntax', {'for': 'python'}
endif

" Kdb/q
Plug 'katusk/vim-qkdb-syntax', {'for': 'q'}

" c++
Plug 'vim-jp/vim-cpp', {'for': 'cpp'}
Plug 'octol/vim-cpp-enhanced-highlight', {'for': 'cpp'}

call plug#end()
" }}}

filetype plugin indent on

" Settings {{{

" GUI related
if has('gui_running') || get(g:, 'neovim-qt', 0)
    set guioptions=g
    set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20
    set guifont=source_code_pro:h10
else
   set t_Co=256
   set t_ut=
   set t_vb=
endif

" True color support
if has('termguicolors')
    set termguicolors
endif


" configs for vim since neovim has set them by default
if has('nvim')
   set list
   set listchars=tab:▸\ ,eol:¬
else
    set ruler
    set hidden
    set nobackup
    set wildmenu
    set autoread
    set incsearch
    set autoindent
    set foldenable
    set history=5000
    set encoding=utf-8
    set backspace=eol,start,indent

    set termkey=<c-e>
endif

" default in (neo)vim
" set showcmd
" set noshowmatch

" universial settings
set nowrap
set number
set mouse=a
set noshowmode
set nolazyredraw
set laststatus=2
set shortmess+=c
set relativenumber
set fileformat=unix
set clipboard+=unnamed,unnamedplus

" timeout setting
set ttimeout
set ttimeoutlen=100

" Turn off backup
set noswapfile
set nowritebackup

" Search configuration
set ignorecase
set smartcase

" Tab and Indent configuration
set tabstop=8
set shiftwidth=4
set softtabstop=4
set expandtab

" Folding
" set foldmethod=syntax

" Unused settings
" set visualbell
" set background=dark

" }}}

" General Key Mappings  {{{

" Don't go to Ex mode
nnoremap Q <nop>

inoremap <c-c> <ESC>
nnoremap <space> za
" nnoremap ,<space> :set hlsearch!<cr>

" Move Around {{{
map j gj
map k gk
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h
nnoremap <c-k> <c-w>k
nnoremap <c-j> <c-w>j

" vnoremap H ^
" vnoremap L $
" set whichwrap+=<,>,h,l
" }}}


" Stay in visual after shifting
vmap < <gv
vmap > >gv

" Editing/Loading .vimrc
noremap <c-e><c-v> :vs ~/.vimrc<cr>

" Fold All but current
nnoremap <localleader>l zR
nnoremap <localleader>f zMzvzz

" terminal
tnoremap <Esc> <C-\><C-n>

" Leader Key
let g:mapleader = ','

nmap <F4> :set nowrap! <cr>
nmap <c-s> :w!<cr>
nmap <leader>w :cd %:p:h<cr>

" }}}

" UI related plugins {{{

let g:base16colorspace=256
colorscheme base16-gruvbox-dark-medium

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

let g:airline_powerline_fonts = 1
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N', 'i'  : 'I',
    \ 'R'  : 'R', 'c'  : 'C',
    \ 'v'  : 'V', 'V'  : 'V', '' : 'V',
    \ 's'  : 'S', 'S'  : 'S', '' : 'S',
    \ 't'  : 'T',
    \ }

" echodoc
let g:echodoc_enable_at_startup = 1

" cpp
let g:cpp_concepts_highlight = 1

" python-syntax
let g:python_highlight_all = 1

" vim-gitgutter
let g:gitgutter_enabled = 1

" NERD Tree
nmap <leader>e :NERDTreeToggle<cr>
let g:NERDTreeNaturalSort=1
let g:NERDTreeWinSize=28
let g:NERDTreeIgnore=['\.pyc$', '\~$', '__pycache__', '_minted-*', 'node_modules']
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" }}}

" Behavior Plugins {{{

" vim-choosewin
nmap - <Plug>(choosewin)

" sideways
nnoremap <a-h> :SidewaysLeft<cr>
nnoremap <a-l> :SidewaysRight<cr>

" vim-Plug
command! PU PlugUpdate | PlugUpgrade
command! PS PlugStatus
command! PI PlugInstall
command! PC PlugClean


" }}}

" Tagbar & gutentags {{{
let g:rooter_patterns = ['setup.py', '.git/']

let g:tagbar_width = 30
let g:tagbar_previewwin_pos = 'aboveleft'
nnoremap <F8> :TagbarToggle<cr>

let g:gutentags_project_root= ['setup.py', '.git']
let g:gutentags_add_default_project_roots = 0
let g:gutentags_ctags_exclude = [
            \ '__pycache__',
            \ 'dist',
            \ '*.ipynb',
            \ '*.xlsx',
            \ '*.csv',
            \ '*.sql',
            \ '.ipynb_checkpoints',
            \ 'node_modules',
            \ '*.q'
            \ ]
" let g:gutentags_ctags_extra_args = ['--fields=+l', '--python-kinds=-i']

" }}}

" UltiSnips {{{
let g:UltiSnipsExpandTrigger = '<TAB>'
let g:UltiSnipsJumpForwardTrigger  = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'

" let g:UltiSnipsEditSplit = 'context'
let g:UltiSnipsEditSplit = 'vertical'
" let g:UltiSnipsRemoveSelectModeMappings = 0

nnoremap <c-e><c-u> :UltiSnipsEdit<cr>

" }}}

" AutoFormat {{{
noremap <F4> :Autoformat<CR>
let g:formatters_python = ['autopep8']
" let g:formatdef_google_style_cpp = '"clang-format -i --style=''{BasedOnStyle: Google, IndentWidth: 4, AccessModifierOffset: -4, ColumnLimit: 100}''"'
" let g:formatters_cpp = ['google_style_cpp']
" }}}

" Ale {{{
let g:ale_completion_enabled = 0
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_linters = {
    \ 'python': ['flake8', 'pylint'],
    \ 'vim': ['vint'],
    \ 'cpp': ['clang', 'clang-tidy']
    \ }
" \ 'python': ['flake8', 'pylint', 'mypy'],

"" linter configs
let g:ale_python_pylint_options = '--errors-only --rcfile=~/.pylintrc'

let g:ale_fixers = {
    \ 'python': ['autopep8'],
    \ }

nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)

" noremap <F3> :ALEFix<CR>
" }}}

if get(b:, 'use_lsp', 0)
    " LanguageClient {{{
    let g:LanguageClient_diagnosticsEnable = 0

    let g:LanguageClient_serverCommands = {
        \ 'python': ['pyls', '-vv'],
        \ 'sh': ['bash-language-server', 'start'],
        \ 'typescript': ['javascript-typescript-stdio']
    \ }

    nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
    nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
    nnoremap <silent> <F3> :call LanguageClient#textDocument_definition()<CR>
    nnoremap <silent> <F5> :call LanguageClient_contextMenu()<CR>

    nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
    nnoremap <silent> ghd :call LanguageClient#textDocument_definition({'gotoCmd': 'split'})<CR>
    nnoremap <silent> gvd :call LanguageClient#textDocument_definition({'gotoCmd': 'vsplit'})<CR>
    " }}}
endif

if get(b:, 'complete_backend', 'ycmd') ==? 'ycmd'
    " YCM {{{
    let g:ycm_python_binary_path = g:python3_host_prog
    let g:ycm_server_python_interpreter = g:python3_host_prog
    let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
    let g:ycm_complete_in_comments_and_strings = 1
    let g:ycm_autoclose_preview_window_after_insertion  = 1
    let g:ycm_autoclose_preview_window_after_completion = 1
    let g:ycm_collect_identifiers_from_tags_files = 1

    " Make YCM compatible with UltiSnips
    let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
    let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']

    if !exists('g:ycm_semantic_triggers')
        let g:ycm_semantic_triggers = {}
    endif

    " set semantic triggers
    let g:ycm_semantic_triggers.vim = ['.', 're!\w{2}']
    let g:ycm_semantic_triggers.python = ['.', 're!\w{3}']
    let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme

    " YCM goto command
    let g:ycm_goto_buffer_command = 'split'
    nnoremap <silent> gd :YcmCompleter GoTo<CR>
   " }}}
else
    if get(b:, 'complete_backend', 'ycmd') ==? 'deoplete'
        " Deoplete {{{
        let g:deoplete#enable_at_startup = 1
        call deoplete#custom#option({'auto_refresh_delay': 100})

        "call deoplete#custom#source('LanguageClient', 'min_pattern_length', 1)
        imap <expr><c-space> deoplete#manual_complete()

        inoremap <expr><c-h> deoplete#smart_close_popup()."\<c-h>"
        inoremap <expr><bs>  deoplete#smart_close_popup()."\<c-h>"
        inoremap <expr><c-l> deoplete#refresh()

        augroup Deoplete
            autocmd!
            autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
        augroup END

        if !exists('g:deoplete#omni#input_patterns')
            let g:deoplete#omni#input_patterns = {}
        endif

        " register sources
        let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete

        " }}}
    else
        " NCM2 {{{
        " enable ncm2 for all buffer
        augroup NcmBuffer
            autocmd!
            autocmd BufEnter * call ncm2#enable_for_buffer()

            " enable auto complete for `<backspace>`, `<c-w>` keys.
            " known issue https://github.com/ncm2/ncm2/issues/7
            autocmd TextChangedI * call ncm2#auto_trigger()

            " note that must keep noinsert in completeopt, the others is optional
            set completeopt=noinsert,menuone,noselect

            " When the <Enter> key is pressed while the popup menu is visible, it only
            " hides the menu. Use this mapping to close the menu and also start a new line.
            inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

            " Press TAB to trigger snippet expansion
            inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')

            " pyclang
            let s:clang_library_path= 'C:/Program Files/LLVM/bin'
            if isdirectory(s:clang_library_path)
               let g:ncm2_pyclang#library_path=s:clang_library_path . '/libclang.dll'
            endif

            let g:ncm2_pyclang#database_path = ['compile_commands.json', 'build/compile_commands.json']
            autocmd FileType c,cpp nnoremap <buffer> gd :<c-u>call ncm2_pyclang#goto_declaration()<cr>

            " Register Sources
            autocmd Filetype tex call ncm2#register_source({
                    \ 'name': 'vimtex',
                    \ 'priority': 8,
                    \ 'scope': ['tex'],
                    \ 'mark': 'tex',
                    \ 'word_pattern': '\w+',
                    \ 'complete_pattern': g:vimtex#re#ncm2,
                    \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
                    \ })
        augroup END
        " }}}
    endif
endif

" vimtex {{{
let g:tex_flavor  = 'latex'
let g:tex_conceal = ''
let g:vimtex_toc_fold = 1
let g:vimtex_fold_manual = 1
let g:vimtex_format_enabled = 1
let g:vimtex_view_automatic = 1
let g:vimtex_echo_ignore_wait = 1
let g:vimtex_latexmk_continuous = 1

let g:vimex_view_method = 'skim'

if has('nvim')
   let g:vimtex_compiler_progname = 'nvr'
endif

let g:tex_fold_override_foldtext = 1
let g:tex_fold_additional_envs = ['itemize', 'enumerate']

let g:vimtex_compiler_latexmk = {
    \ 'options': [
    \   '-pdf',
    \   '--shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}

let g:vimtex_quickfix_latexlog = {
    \ 'overfull' : 0,
    \ 'underfull': 0,
    \ 'packages' : { 'hyperref' : 0 },
    \}

augroup MyVimtex
    autocmd!
    autocmd User VimtexEventQuit VimtexClean
    autocmd FileType tex nnoremap <leader>lv :VimtexView<cr>
    autocmd FileType tex nnoremap <leader>lc :VimtexClean<cr>
    autocmd FileType tex nnoremap <leader>lC :VimtexClean!<cr>
    autocmd FileType tex nnoremap <leader>le :VimtexError<cr>
    autocmd FileType tex nnoremap <leader>ll :VimtexCompile<cr>
    autocmd FileType tex nnoremap <leader>lt :VimtexTocToggle<cr>

    autocmd FileType tex setlocal spell linebreak
    autocmd FileType tex setlocal conceallevel=2
    autocmd FileType tex let b:delimitMate_quotes="\" '"
augroup END
" }}}

" FZF {{{
command! -bang Colors
  \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
" }}}

" FastFold {{{
let g:tex_fold_enabled = 1
let g:fastfold_fdmhook = 1
let g:fastfold_skip_filetypes = ['taglist', 'Tagbar', 'NERD']
" }}}

" q {{{
augroup KDB
    autocmd!
    autocmd FileType q let b:delimitMate_quotes="\" '"
augroup END
" }}}

" SQL {{{
augroup SQL
    autocmd!
    autocmd BufRead,BufNewFile *.sql syn keyword SybaseDataType BIGINT
    autocmd BufRead,BufNewFile *.sql syn keyword SybaseFunction SUBSTRING ISNULL DATEIFF
    autocmd BufRead,BufNewFile *.sql highlight link SybaseDataType Special
    autocmd BufRead,BufNewFile *.sql highlight link SybaseFunction Function
augroup END
" }}}

" better-whitespace {{{
let g:better_whitespace_operator='<leader>t'
let g:better_whitespace_enabled= 1
let g:strip_whitespace_on_save = 1
" }}}

" neoterm {{{
if has('win32') && has('nvim')
   let g:neoterm_eof="\<cr>"
endif

let g:neoterm_size = '83'
let g:neoterm_default_mod = 'vertical rightbelow'
let g:neoterm_repl_python='ipython --no-autoindent --automagic --no-banner'

nnoremap <c-e><c-t> :Ttoggle<cr>
nnoremap <c-e><c-l> :Tclear<cr>
nnoremap <c-cr> :call neoterm#do({'cmd': ""})<cr>
nnoremap <s-cr> :TREPLSendLine<cr>
vnoremap <s-cr> :TREPLSendSelection<cr>

" Lanuch q console
command! KDB execute "T q"

" }}}

" Custom Function for Font Size {{{ "
let b:gui_font_size = 10

function! DecreaseFont() abort
    let b:gui_font_size = get(b:, 'gui_font_size', 10) - 1
    echom 'setting font size to ' . get(b:, 'gui_font_size', 10)
    execute 'GuiFont! source code pro:h' . get(b:, 'gui_font_size', 10)
endfunction

function! IncreaseFont() abort
    let b:gui_font_size = get(b:, 'gui_font_size', 10) + 1
    echom 'setting font size to ' . get(b:, 'gui_font_size', 10)
    execute 'GuiFont! source code pro:h' . get(b:, 'gui_font_size', 10)
endfunction

nnoremap <c--> :call DecreaseFont()<cr>
nnoremap <c-=> :call IncreaseFont()<cr>
" }}}

" vim:foldmethod=marker:foldlevel=1
