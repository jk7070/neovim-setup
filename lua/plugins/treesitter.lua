return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = { "c", "lua", "javascript", "typescript", "html", "python", "go", "rust"},
      -- auto_install = true,
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
      }
    })
  end,
}
