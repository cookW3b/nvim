vim.keymap.set('v', '<C-c>', '"+y')      -- Copy
vim.keymap.set('n', '<C-v>', '"+P')      -- Paste normal mode
vim.keymap.set('v', '<C-v>', '"+P')      -- Paste visual mode
vim.keymap.set('c', '<C-v>', '<C-R>+')

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "<leader>bd", ":bdelete<cr>")
