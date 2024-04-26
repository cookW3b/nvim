require("config.options")
require("config.keymaps")
require("config.lazy")

vim.cmd([[colorscheme catppuccin]])

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})
