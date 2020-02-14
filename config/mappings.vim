if exists('b:mappings_loaded')
  finish
endif

let b:mappings_loaded = 1

nnoremap Q <nop>
inoremap <c-c> <esc>
nnoremap <space> za

map j gj
map k gk

nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h
nnoremap <c-k> <c-w>k
nnoremap <c-j> <c-w>j

nnoremap <c-e><c-v> :vs $MYVIMRC<cr>
nnoremap <leader>f zMzvzz
tnoremap <esc> <c-\><c-n>
