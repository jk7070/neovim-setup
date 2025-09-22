require("vim-opts")
require("config.lazy")

vim.filetype.add({
  extension = {
    testbench = "yaml",
    op = "yaml",
    dc = "yaml",
    ac = "yaml",
    noise = "yaml",
    tran = "yaml",
    config = "yaml",
  },
})

-- Default root markers for all LSP servers
vim.lsp.config("*", {
  root_markers = {
    "pyproject.toml",
    ".git",
  },
})

-- Setup basedpyright
vim.lsp.config("basedpyright", {
  cmd = { "basedpyright-langserver", "--stdio" },
  filetypes = { "python" },
  settings = {
    basedpyright = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "openFilesOnly",
        useLibraryCodeForTypes = true,
      },
    },
  },
  on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  end,
  -- capabilities = capabilities,
})

-- Enable the server
vim.lsp.enable("basedpyright")
