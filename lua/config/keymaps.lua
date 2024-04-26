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

local function spell_current_file()
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_command("vsplit")

  local path = vim.api.nvim_buf_get_name(0)
  local handle = io.popen("cspell " .. path)
  local res = handle:read("*a")
  handle:close()

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(res, "\n"))
  vim.api.nvim_buf_set_option(buf, "buftype", "nofile")
  vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")
  vim.api.nvim_win_set_buf(0, buf)
end


-- local function spell_current_file()
--   local path = vim.api.nvim_buf_get_name(0)
--   local handle = io.popen("codespell " .. path)
--   local res = handle:read("*a")
--   handle:close()
--   print(res)
-- end

map.set("n", "<leader>cb", spell_current_file)
