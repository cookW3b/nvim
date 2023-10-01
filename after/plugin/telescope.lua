local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})                                -- find files by name
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})                                 -- find string in files
vim.keymap.set('n', '<leader>FF', ':Telescope find_files no_ignore=true hidden=true<cr>')-- find files by name
vim.keymap.set('n', '<leader>FG', ':Telescope live_grep no_ignore=true hidden=true<cr>') -- find string in files
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})                                   -- find buffers
vim.keymap.set('n', '<leader>fr', builtin.resume, {})                                    -- last picker
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

require('telescope').setup({
  defaults = {
    mappings = {
      n = {
        ["<leader>pr"] = require('telescope.actions.layout').toggle_preview
      }
    },
    preview = {
      hide_on_startup = true
    }
  },
  pickers = {
    buffers = {
      initial_mode = "normal",
      show_all_buffers = true,
      sort_mru = true,
      mappings = {
        n = {
          ["<c-d>"] = "delete_buffer",
        },
      },
    },
  },
})
