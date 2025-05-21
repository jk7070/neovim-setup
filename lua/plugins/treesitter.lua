return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = { "c", "lua", "javascript", "typescript", "html", "python", "go", "rust" },
      -- auto_install = true,
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,

  init = function()
    vim.g.matchparen_disable_cursor_hl = 1
    --   vim.g.loaded_matchparen = 1
  end,
}
