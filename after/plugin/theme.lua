local dark_theme = "catppuccin-mocha"
local light_theme = "catppuccin-mocha"

local handle_time = io.popen("date '+%T'")
local time = handle_time:read("*a")

handle_time:close()

local hour = tonumber(string.sub(time, 0, 2))
local night_time = 17

if hour >= night_time then
  vim.cmd('colorscheme ' .. dark_theme)
else
  vim.cmd('colorscheme ' .. light_theme)
end

vim.api.nvim_set_hl(0, "LineNr", { fg = "#F5C2E7" })
vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#575268" })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#575268" })
