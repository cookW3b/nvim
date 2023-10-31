vim.g.mapleader =  " "
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

vim.keymap.set('n', '<leader>pw', vim.cmd.vsplit)

-- vim.keymap.set('n', '<leader>git', ':Git<cr>')
-- vim.keymap.set('n', '<leader>gd', ':Gvdiffsplit<cr>')

vim.keymap.set('v', '<C-c>', '"+y')      -- Copy
vim.keymap.set('n', '<C-v>', '"+P')      -- Paste normal mode
vim.keymap.set('v', '<C-v>', '"+P')      -- Paste visual mode
vim.keymap.set('c', '<C-v>', '<C-R>+')

vim.keymap.set('n', '<leader>fo', ':browse oldfiles<cr>') -- list of old files

vim.keymap.set('n', '<leader>bd', ':bdelete<cr>') -- delete current buffer

vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)

vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<cr>')
