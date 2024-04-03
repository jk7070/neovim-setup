local lspconfig = require('lspconfig')

-- Python
lspconfig.jedi_language_server.setup{}

-- Typescript
lspconfig.tsserver.setup{}

-- Rust
lspconfig.rust_analyzer.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ['rust-analyzer'] = {},
  },
}
