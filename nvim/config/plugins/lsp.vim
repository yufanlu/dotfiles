if exists('b:lsp_config_loaded')
  finish
endif

let b:lsp_config_loaded = 1


augroup LSPConfig
  autocmd Filetype python,vim,sh,lua setlocal omnifunc=v:lua.vim.lsp.omnifunc
augroup END

nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
" nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
" nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
" nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
