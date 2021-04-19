local vim = vim

-- load packer
vim.cmd [[packadd packer.nvim]]
local packer = require('packer')

packer.startup(function()
  use {'wbthomason/packer.nvim', opt = true}

  -- UI
  use { 'chriskempson/base16-vim' }
  use { 'Yggdroot/indentLine' }
  use { 'ntpeters/vim-better-whitespace' }

  use { 'junegunn/vim-slash' }
  use { 'justinmk/vim-dirvish' }

  -- telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  -- use { 'nvim-telescope/telescope-packer.nvim' }

  -- lua
  use { 'tjdevries/nlua.nvim' }

  -- lsp and completion
  use { 'neovim/nvim-lspconfig' }
  use { 'nvim-lua/completion-nvim' }

  -- commentary
  use { 'tpope/vim-commentary' }

end)
