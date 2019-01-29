if exists('b:ycmd_config_loaded')
  finish
endif

let b:ycmd_config_loaded = 1


let g:ycm_python_binary_path = g:python3_host_prog
let g:ycm_server_python_interpreter = g:python3_host_prog
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

let g:ycm_complete_in_comments_and_strings = 0
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_autoclose_preview_window_after_insertion  = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" Make YCM compatible with UltiSnips
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']

if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif

" set semantic triggers
let g:ycm_semantic_triggers.vim = ['.', 're!\w{2}']
let g:ycm_semantic_triggers.python = ['.', 're!\w{3}']
" let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme

" YCM goto command
let g:ycm_goto_buffer_command = 'split'

nnoremap <silent> K :YcmCompleter GoDoc<cr>
nnoremap <silent> <F1> :YcmCompleter GoTo<cr>
nnoremap <silent> <F2> :YcmCompleter GoToReferences<cr>
