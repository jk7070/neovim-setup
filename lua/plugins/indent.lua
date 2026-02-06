-- return {
--   "lukas-reineke/indent-blankline.nvim",
--
--   config = function()
--     require('ibl').setup({ indent = { highlight = "#E06C75" } })
--   end,
-- }

return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl", -- ✅ ensures the new module name is used
  ---@module "ibl"
  ---@type ibl.config
  opts = {
    indent = {
      char = "┆", -- ← change this character
      highlight = { "IndentColor" }
    }
  },

  config = function(_, opts)
    local hooks = require("ibl.hooks")

    -- Ensure the highlight is re-applied when colorschemes change
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "IndentColor", { fg = "#F28A92" })
    end)


    require('ibl').setup(opts)
  end,
}
