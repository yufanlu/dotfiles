if exists('b:coc_config_loaded')
  finish
endif

let b:coc_config_loaded = 1

set updatetime=300
set signcolumn=yes

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

nmap <silent> [w <Plug>(coc-diagnostic-prev)
nmap <silent> ]w <Plug>(coc-diagnostic-next)

" Remap for format selected region
vmap <leader>f <Plug>(coc-format-selected)
" nmap <leader>f <Plug>(coc-format-selected)
nmap <leader>qf  <Plug>(coc-fix-current)
nnoremap <silent> K :call CocAction('doHover')<CR>

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" " Use `:Fold` for fold current buffer
" command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Using CocList
nnoremap <silent> <leader>a :<C-u>CocList diagnostics<cr>
" nnoremap <silent> <leader>e :<C-u>CocList extensions<cr>
" nnoremap <silent> <leader>c :<C-u>CocList commands<cr>
" nnoremap <silent> <leader>o :<C-u>CocList outline<cr>
" nnoremap <silent> <leader>s :<C-u>CocList -I symbols<cr>
" nnoremap <silent> <leader>j :<C-u>CocNext<CR>
" nnoremap <silent> <leader>k :<C-u>CocPrev<CR>
" nnoremap <silent> <leader>p :<C-u>CocListResume<CR>

