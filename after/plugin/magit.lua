local neogit = require('neogit')
neogit.setup()

vim.keymap.set('n', '<leader>gg', function() neogit.open() end)
vim.keymap.set('n', '<leader>gv', function() neogit.open({ kind = 'split' }) end)
