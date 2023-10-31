local lspkind = require('lspkind')

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

local function border(hl_name)
  return {
    { "╭", hl_name },
    { "─", hl_name },
    { "╮", hl_name },
    { "│", hl_name },
    { "╯", hl_name },
    { "─", hl_name },
    { "╰", hl_name },
    { "│", hl_name },
  }
end

cmp.setup({
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp'},
    {name = 'nvim_lua'},
  },
  completion = {
    completeopt = "menu,menuone",
    -- border = border "CmpDocBorder"
  },

  window = {
    completion = {
      winhighlight = "Normal:CmpPmenu,Search:PmenuSel",
      side_padding = 1,
      scrollbar = false,
      border = border "CmpDocBorder"
    },
    documentation = {
      border = border "CmpDocBorder",
      winhighlight = "Normal:CmpDoc",
    },
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text', -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      before = function (entry, vim_item)
        return vim_item
      end
    })
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-c>"] = cmp.mapping.abort(),
    ['<Tab>'] = vim.NIL
  }
})
