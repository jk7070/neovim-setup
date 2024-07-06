return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "jsonls", "rust_analyzer", "gopls", "jedi_language_server", "tsserver" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- lua
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })

      -- javascript / typescript
      lspconfig.tsserver.setup({
        capabilities = capabilities,
      })

      -- rust
      lspconfig.rust_analyzer.setup({
        settings = {
          ["rust-analyzer"] = {},
        },
        capabilities = capabilities,
      })

      -- python
      lspconfig.jedi_language_server.setup({
        capabilities = capabilities,
      })

      -- golang
      lspconfig.gopls.setup({
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
            },
            staticcheck = true,
            gofumpt = true,
          },
        },
        capabilities = capabilities,
      })
    end,
  },
}
