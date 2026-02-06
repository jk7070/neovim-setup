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


local function common_on_attach(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
end

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
  on_attach = common_on_attach
})

-- Enable the server
vim.lsp.enable("basedpyright") -- Setup rust-analyzer

-- Setup rust server
vim.lsp.config("rust_analyzer", {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  root_markers = { "Cargo.toml", "rust-project.json" },
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
      check = {
        command = "clippy",
      },
    },
  },
  on_attach = common_on_attach,
})
-- Enable the server
vim.lsp.enable("rust_analyzer")

-- Format Rust files on save using rust-analyzer's built-in formatter (rustfmt)
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.rs",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

-- Setup lua_ls (Lua Language Server)
vim.lsp.config("lua_ls", {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml", ".git" },
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT", -- Use LuaJIT for Neovim
      },
      diagnostics = {
        globals = { "vim" }, -- Recognize 'vim' global
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true), -- Make the server aware of Neovim runtime files
        checkThirdParty = false,                           -- Disable third-party checking prompt
      },
      telemetry = {
        enable = false,
      },
    },
  },
  on_attach = common_on_attach
})
-- Enable the server
vim.lsp.enable("lua_ls")

-- Setup for system verilog
vim.lsp.config("svlangserver", {
  cmd = { "svlangserver" },
  filetypes = { "systemverilog", "verilog" },
  root_markers = {
    ".svlangserver",
    ".git",
  },
  on_attach = common_on_attach,
})

vim.lsp.enable("svlangserver")
