return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,

        -- golang
        null_ls.builtins.formatting.goimports,

        -- python
        null_ls.builtins.diagnostics.ruff,
        null_ls.builtins.formatting.ruff,

        -- javascript, typescript, HTML
        null_ls.builtins.formatting.prettier,
        -- null_ls.builtins.diagnostics.biome,
      },
    })
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
