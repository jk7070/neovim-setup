require("vim-opts")
require("config.lazy")

vim.filetype.add({
  extension = {
    op = "yaml",
    dc = "yaml",
    ac = "yaml",
    noise = "yaml",
    tran = "yaml",
    config = "yaml",
  },
})
