if exists('b:ncm2_config_loaded')
  finish
endif

let b:ncm2_config_loaded = 1

augroup NcmBuffer
  autocmd!
  autocmd BufEnter * call ncm2#enable_for_buffer()

  " note that must keep noinsert in completeopt, the others is optional
  set completeopt=noinsert,menuone,noselect,preview
  autocmd CompleteDone * silent! pclose!

  " when the <Enter> key is pressed while the popup menu is visible, it only
  " hides the menu. Use this mapping to close the menu and also start a new line.
  inoremap <expr> <cr> (pumvisible() ? "\<c-y>\<cr>" : "\<cr>")

  " press TAB to trigger snippet expansion
  inoremap <silent> <expr> <cr> ncm2_ultisnips#expand_or("\<cr>", 'n')
augroup END

