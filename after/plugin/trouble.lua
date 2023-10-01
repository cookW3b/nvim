local trouble = require('trouble')

vim.keymap.set('n', '<leader>dt', function() trouble.open('document_diagnostics') end)
vim.keymap.set('n', '<leader>wt', function() trouble.open('workspace_diagnostics') end)
