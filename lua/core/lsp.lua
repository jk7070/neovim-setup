local lspconfig = require('lspconfig')
local on_attach = require('core/lspconfig').on_attach()
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Python
lspconfig.jedi_language_server.setup{
  capabilities = capabilities
}

-- Typescript
lspconfig.tsserver.setup{}

-- Rust
lspconfig.rust_analyzer.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ['rust-analyzer'] = {},
  },
}

-- Go
local util = require "lspconfig/util" 
lspconfig.gopls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = {"go", "gomod", "gowork", "gotmpl"},
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  -- settings = {
  --   gopls = {
  --     analyses = {
  --       unusedparams = true,
  --     },
  --     staticcheck = true,
  --     gofumpt = true,
  --   },
  -- },

})
