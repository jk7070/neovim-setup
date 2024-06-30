local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed = { "c", "lua", "javascript", "typescript", "html", "python", "go" },
  sync_install = false,
  highlight = { enable = true },
  indent = { enable = true }, 
})
