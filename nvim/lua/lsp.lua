
local api = vim.api
local nvim_lsp = require'nvim_lsp'

nvim_lsp.pyls_ms.setup{
  -- on_attach = on_attach,
  settings = {
    python = {
      jediEnabled = False,
    }
  }
}

nvim_lsp.vimls.setup{}
nvim_lsp.bashls.setup{}
