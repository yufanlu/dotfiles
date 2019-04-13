if exists('b:vimtex_config_loaded')
  finish
endif

let b:vimtex_config_loaded = 1

set conceallevel=2
let g:tex_flavor  = 'latex'
let g:tex_conceal = 'abdgm'
let g:vimtex_latexmk_continuous = 1

let g:vimtex_view_method = 'skim'
let g:vimtex_view_automatic = 1

let g:vimtex_toc_fold = 1
let g:vimtex_fold_enabled = 1
let g:vimtex_format_enabled = 1

if has('nvim')
  let g:vimtex_compiler_progname = 'nvr'
endif

augroup VimTexConfig
    autocmd FileType tex nnoremap <leader>lv :VimtexView<cr>
    autocmd FileType tex nnoremap <leader>lc :VimtexClean<cr>
    autocmd FileType tex nnoremap <leader>lC :VimtexClean!<cr>
    autocmd FileType tex nnoremap <leader>le :VimtexError<cr>
    autocmd FileType tex nnoremap <leader>ll :VimtexCompile<cr>
    autocmd FileType tex nnoremap <leader>lt :VimtexTocToggle<cr>
    autocmd FileType tex setlocal spell foldmethod=expr
    autocmd FileType tex setlocal foldexpr=vimtex#fold#level(v:lnum)
    autocmd FileType tex setlocal foldtext=vimtex#fold#text()
    autocmd FileType tex let b:delimitMate_quotes="\" '"
augroup END
