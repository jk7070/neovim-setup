return {
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    -- require("mason-lspconfig").setup({
    --   automatic_enable = {
    --     "lua_ls",
    --   }
    --   -- ensure_installed = {
    --   --   "lua_ls",
    --   --   "jsonls",
    --   --   "rust_analyzer",
    --   --   "gopls",
    --   --   "jedi_language_server",
    --   --   "pyright",
    --   --   "ruff",
    --   --   "ts_ls",
    --   --   "html",
    --   -- },
    -- })
  },
  {
    "mrcjkb/rustaceanvim",
    version = '^5', -- Recommended
    lazy = false,   -- This plugin is already lazy
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end
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

      -- lspconfig.pyright.setup({
      --   capabilities = capabilities,
      -- })

      lspconfig.ruff.setup({
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
