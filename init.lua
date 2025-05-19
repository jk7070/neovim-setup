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
