return {
  'nvim-telescope/telescope.nvim',
  config = function ()
    require("telescope").setup({
      defaults = {
        mappings = {
          n = {
            ['<C-p>'] = require('telescope.actions.layout').toggle_preview
          }
        }
      },
      pickers = {
        find_files = {
          theme = "dropdown",
          previewer = false
        },
        live_grep = {
          theme = "dropdown",
          previewer = false
        },
        -- buffers = {
        --   theme = "dropdown"
        -- },
        -- lsp_document_symbols = {
        --   theme = "dropdown"
        -- }
      },
    })
  end,
  dependencies = {
    "nvim-telescope/telescope-frecency.nvim"
  },
  init = function()
    local builtin = require('telescope.builtin')

    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    vim.keymap.set('n', '<leader>ss', builtin.lsp_document_symbols)
    vim.keymap.set('n', '<leader>fp', require("telescope.builtin").resume, {})
  end
}

