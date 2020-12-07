local vim = vim
local lsp = require'lsp'
local plugins = require'plugins'



-- disable built-in plugins
vim.g.loaded_tar = 1
vim.g.loaded_zip = 1
vim.g.loaded_gzip = 1
vim.g.loaded_netrw = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_netrwPlugin = 1

-- disable python2, ruby providers
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python_provider = 0
vim.g.python3_host_prog = 'python3'


-- settings
vim.o.list = true
vim.o.listchars = 'tab:▸ ,eol:¬'

vim.o.number = true
vim.o.relativenumber = true

vim.o.ignorecase = true

vim.o.mouse = 'a'
vim.o.laststatus = 2

vim.o.shortmess = 'filnxtToOF'
vim.o.completeopt = 'menuone,noinsert,noselect'


vim.o.expandtab = true
vim.o.termguicolors = true


vim.g.mapleader = " "


vim.g.base16colorspace = 256
vim.api.nvim_command('colorscheme base16-nord')


-- TODO: wait for https://github.com/neovim/neovim/pull/12378
vim.cmd [[
augroup MyShiftWidth
  autocmd filetype vim,lua setlocal shiftwidth=2
augroup END
]]

-- completion settings
-- vim.g.completion_trigger_keyword_length = 3

-- telescope keymapping
vim.cmd [[
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').help_tags()<cr>

nnoremap <leader>p <cmd>lua require('telescope.builtin').git_files()<cr>
]]
