vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.g.mapleader = " "

require("config.lazy")
require("config.colorscheme")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

require("plugins.treesitter")

-- require("core.options")
-- require("core.keymaps")
-- require("core.plugins")
-- require("core.colorscheme")
-- require("core.treesitter")
-- require("core.lsp")
-- require("core.cmp")
--
-- vim.g['airline_theme'] = 'jellybeans'
-- vim.g['airline#extensions#tabline#enabled'] = 1
-- vim.g['airline#extensions#branch#enabled'] = 1

