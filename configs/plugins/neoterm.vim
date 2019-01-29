if exists('b:neoterm_config_loaded')
  finish
endif

let b:neoterm_config_loaded = 1

let g:neoterm_size = '15'
let g:neoterm_default_mod = 'rightbelow'
let g:neoterm_repl_python = 'ipython --no-autoindent --automagic --no-banner'

if has('win32')
    let g:neoterm_shell = '"c:\Program Files\Git\Bin\sh.exe" -f'
endif

