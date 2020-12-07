local lspconfig = require'lspconfig'
local completion = require'completion'

lspconfig.pyls_ms.setup{
  on_attach = completion.on_attach
}

lspconfig.vimls.setup{
  on_attach=completion.on_attach
}

lspconfig.bashls.setup{
  on_attach=completion.on_attach
}

-- lspconfig.sumneko_lua.setup{
require'nlua.lsp.nvim'.setup(
  require('lspconfig'), {
    on_attach=completion.on_attach,
    -- Include globals you want to tell the LSP are real :)
    globals = {
      -- Colorbuddy
      "vim", "c", "Group", "g", "s",
    }
  }
)

