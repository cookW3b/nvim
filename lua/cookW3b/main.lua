vim.opt.wrap = false

vim.opt.smartindent = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.backup = false
vim.opt.swapfile = false

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.termguicolors = true

vim.opt.spelllang = 'en_us'
vim.opt.spell = true

-- Autoremove trailing spaces
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})
