require("config.options")
require("config.keymaps")
require("config.lazy")

-- Enable filetype plugin
vim.cmd('filetype plugin on')
vim.cmd([[colorscheme bamboo]])

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})
