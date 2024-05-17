local g = vim.g
local o = vim.opt
local w = vim.wo
g.mapleader = " "

o.cursorline = true
o.cmdheight = 1
o.autoindent = true
o.smartindent = true
o.expandtab = true -- space instead of tabs
o.shiftwidth = 2   -- size of an indent
o.tabstop = 2      -- number of space in tab
o.softtabstop = 2
o.scrolloff = 10
o.colorcolumn = "80"

w.numberwidth = 2
w.relativenumber = true
w.number = true
w.wrap = false

vim.opt.listchars = { space = '·', tab = '> ' }


vim.o.guifont="Source Code Pro"
-- vim.opt.linespace = 15
vim.g.neovide_scale_factor = 1.5
-- o.list = true

-- ffdd33
vim.cmd [[
  augroup line_nr
    autocmd!
    autocmd! ColorScheme * highlight Whitespace guifg=#272a32
      " \ | highlight CursorLineNr guibg=#20232a guifg=#ef596f
  augroup END
]]

vim.cmd [[
  autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
]]



vim.cmd [[
  augroup filetypedetect
    au! BufRead,BufNewFile *.vert,*.frag set filetype=glsl
  augroup END
]]

vim.g.neovide_cursor_vfx_mode = "wireframe"

vim.filetype.add({
  extension = {
    es6 = 'javascript'
  }
})
