return {
  -- "ellisonleao/gruvbox.nvim",
  -- 'shaunsingh/nord.nvim',
  'olivercederborg/poimandres.nvim',
  lazy = false,
  priority = 1000,

  config = function()
    require('poimandres').setup {
    }
  end,

  init = function()
    vim.cmd.colorscheme("poimandres")

    -- next line is needed for poimandres theme to override the bracket/curser highlighting
    vim.cmd([[
      highlight MatchParen guibg=NONE guifg=Yellow gui=underline
    ]])
  end,
}
