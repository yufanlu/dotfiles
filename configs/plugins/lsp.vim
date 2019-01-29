if exists('b:lsp_config_loaded')
  finish
endif

let b:lsp_config_loaded = 1

let g:LanguageClient_diagnosticEnable = 0
let g:LanguageClient_serverCommands = { 'python': ['pyls'] }

nnoremap <silent> K :call LanguageClient#textDocument_hover()<cr>

nnoremap <silent> <F1> :call LanguageClient#textDocument_definition({'gotoCmd': 'vsplit'})<cr>
nnoremap <silent> <F2> :call LanguageClient#textDocument_references()<cr>
nnoremap <silent> <F3> :call LanguageClient#contextMenu()<cr>
