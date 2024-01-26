local g = vim.g
local o = vim.opt
local w = vim.wo
g.mapleader = " "

o.autoindent = true
o.smartindent = true
o.expandtab = true -- space instead of tabs
o.shiftwidth = 2 -- size of an indent
o.tabstop = 2 -- number of space in tab
o.softtabstop = 2

w.numberwidth = 2
w.relativenumber = true
w.number = true
w.wrap = false
