local map = vim.keymap

map.set("n", "<leader>rr", ":!cargo run<cr>")

map.set('v', '<C-c>', '"+y') -- Copy
map.set('n', '<C-v>', '"+P') -- Paste normal mode
map.set('v', '<C-v>', '"+P') -- Paste visual mode
map.set('c', '<C-v>', '<C-R>+')

map.set("v", "<", "<gv")
map.set("v", ">", ">gv")

map.set("n", "<leader>bd", ":bdelete<cr>")

if vim.g.neovide then
  map.set({ "n", "v" }, "<C-+>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>")
  map.set({ "n", "v" }, "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>")
  map.set({ "n", "v" }, "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>")
end

map.set("n", "<leader>wc", ":tabnew<cr>")
map.set("n", "<leader>wq", ":tabclose<cr>")
map.set("n", "<leader>wn", ":tabnext<cr>")
map.set("n", "<leader>wp", ":tabprevious<cr>")
