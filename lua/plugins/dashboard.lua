return {
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {
      -- add any custom options here
    }
  },
  {
    "goolord/alpha-nvim", -- Dashboard for Neovim
    priority = 5,         -- Load after persisted.nvim
    config = function()
      local alpha = require("alpha")

      require("alpha.term")
      local dashboard = require("alpha.themes.dashboard")
      local function button(sc, txt, keybind, keybind_opts)
        local b = dashboard.button(sc, txt, keybind, keybind_opts)
        b.opts.hl = "AlphaButtonText"
        b.opts.hl_shortcut = "AlphaButtonShortcut"
        return b
      end
      -- -- Terminal header
      -- -- dashboard.section.terminal.width = 69
      -- -- dashboard.section.terminal.height = 8
      --
      --
      dashboard.section.buttons.val = {
        button("l", "   Load session", [[<cmd> lua require("persistence").load()<CR>]]),
        button("n", "   New file", "<cmd>ene <BAR> startinsert <CR>"),
        button("r", "   Recent files", "<cmd>Telescope frecency workspace=CWD<CR>"),
        button("f", "   Find file", "<cmd>Telescope find_files hidden=true path_display=smart<CR>"),
        button("s", "󱘣   Search files", "<cmd>Telescope live_grep path_display=smart<CR>"),
        -- button("p", "   Projects", "<cmd>Telescope projects<CR>"),
        button("u", "   Update plugins", "<cmd>lua require('lazy').sync()<CR>"),
        button("q", "   Quit Neovim", "<cmd>qa!<CR>"),
      }
      -- dashboard.section.buttons.opts = {
      --   spacing = 0,
      -- }
      --
      -- -- Footer
      local function footer()
        local total_plugins = require("lazy").stats().count
        local version = vim.version()
        local nvim_version_info = "  Neovim v" .. version.major .. "." .. version.minor .. "." .. version.patch

        return " " .. total_plugins .. " plugins" .. nvim_version_info
      end
      --
      dashboard.section.footer.val = footer()
      dashboard.section.footer.opts.hl = "AlphaFooter"
      dashboard.config.opts.noautocmd = false

      alpha.setup(dashboard.config)
    end,
  }
}
