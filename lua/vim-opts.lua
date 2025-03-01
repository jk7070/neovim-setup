vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")

vim.g.mapleader = " "

-- Auto-detect and activate .venv in project directory
vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    local venv_path = vim.fn.getcwd() .. '/.venv/bin/python'
    if vim.fn.filereadable(venv_path) == 1 then
      vim.notify("Loading project .venv file: " .. venv_path)
      vim.g.python3_host_prog = venv_path
    else
      vim.notify("No .venv found at: " .. venv_path)
    end
  end,
})
