return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    -- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "jsonls",
          "rust_analyzer",
          "gopls",
          "jedi_language_server",
          "ruff",
          "ts_ls",
          "html",
        },
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
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
      })

      lspconfig.html.setup({
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

      lspconfig.ruff.setup({
        capabilities = capabilities,
      })
      -- require('lspconfig').ruff.setup({
      --   init_options = {
      --     settings = {
      --       -- Ruff language server settings go here
      --     }
      --   }
      -- })

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
