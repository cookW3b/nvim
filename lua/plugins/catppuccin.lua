return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      background = {
        light = "latte",
        dark = "mocha",
      },
      transparent_background = false,
      show_end_of_buffer = false,
      integration_default = false,
      styles = {
        keywords = { "bold" },
        loops = { "bold" },
        operators = { "bold" },
        conditionals = { "bold" },
      },
      integrations = {
        barbecue = { dim_dirname = true, bold_basename = true, dim_context = false, alt_background = false },
        cmp = true,
        gitsigns = true,
        illuminate = { enabled = true },
        markdown = true,
        mason = true,
        native_lsp = { enabled = true, inlay_hints = { background = true } },
        neogit = true,
        neotree = true,
        semantic_tokens = true,
        treesitter = true,
        treesitter_context = true,
        vimwiki = true,
        which_key = true,
      },
      color_overrides = {
        mocha = {
          -- rosewater = "#ff7f66",
          -- flamingo = "#ff7f66",
          -- red = "#ff7f66",
          -- maroon = "#ff7f66",
          -- pink = "#df879e",
          -- mauve = "#df879e",
          -- peach = "#fca965",
          -- yellow = "#e0ae6a",
          -- green = "#a5c977",
          -- teal = "#88b992",
          -- sky = "#88b992",
          -- sapphire = "#88b992",
          -- blue = "#72bfb8",
          -- lavender = "#72bfb8",
          -- text = "#eae3d5",
          -- subtext1 = "#d5c9b7",
          -- subtext0 = "#bfb3a5",
          -- overlay2 = "#aca195",
          -- overlay1 = "#958b7e",
          -- overlay0 = "#6f6660",
          -- surface2 = "#585858",
          -- surface1 = "#4b4b4b",
          -- surface0 = "#353535",
          -- -- base = "#000000",
          -- base = "#1d2021",
          -- mantle = "#1d2021",
          -- crust = "#1d2021",

          -- gruber-darker
          rosewater = "#ffffff",
          flamingo = "#ffffff",
          red = "#ffdd33",
          maroon = "#ffffff",
          pink = "#ffdd33",
          mauve = "#ffdd33",
          peach = "#96a6c8",
          yellow = "#899b92",
          green = "#73c936",
          teal = "#88b992",
          sky = "#cc8c3c",
          sapphire = "#96a6c8",
          blue = "#778899",
          lavender = "#778899",
          text = "#eae3d5",
          subtext1 = "#d5c9b7",
          subtext0 = "#bfb3a5",
          overlay2 = "#aca195",
          overlay1 = "#958b7e",
          overlay0 = "#6f6660",
          surface2 = "#585858",
          surface1 = "#4b4b4b",
          surface0 = "#353535",
          base = "#181818",
          mantle = "#1d2021",
          crust = "#1d2021",
        },
      },
      highlight_overrides = {
        all = function(colors)
          return {
            NormalFloat = { bg = colors.base },
            Pmenu = { bg = colors.mantle, fg = "" },
            PmenuSel = { bg = colors.surface0, fg = "" },
            -- CursorLineNr = { fg = colors.text },
            -- LineNr = { fg = colors.surface1 },
            FloatBorder = { bg = colors.base, fg = colors.surface0 },
            VertSplit = { bg = colors.base, fg = colors.surface0 },
            WinSeparator = { bg = colors.base, fg = colors.surface0 },
            LspInfoBorder = { link = "FloatBorder" },
            YankHighlight = { bg = colors.surface2 },
            CmpItemMenu = { fg = colors.surface2 },

            GitSignsChange = { fg = colors.peach },

            NeoTreeDirectoryIcon = { fg = colors.subtext1 },
            NeoTreeDirectoryName = { fg = colors.subtext1 },
            NeoTreeFloatBorder = { link = "TelescopeResultsBorder" },
            NeoTreeGitConflict = { fg = colors.red },
            NeoTreeGitDeleted = { fg = colors.red },
            NeoTreeGitIgnored = { fg = colors.overlay0 },
            NeoTreeGitModified = { fg = colors.peach },
            NeoTreeGitStaged = { fg = colors.green },
            NeoTreeGitUnstaged = { fg = colors.red },
            NeoTreeGitUntracked = { fg = colors.green },
            NeoTreeIndent = { link = "IblIndent" },
            NeoTreeNormal = { bg = colors.mantle },
            NeoTreeNormalNC = { bg = colors.mantle },
            NeoTreeRootName = { fg = colors.subtext1, style = { "bold" } },
            NeoTreeTabActive = { fg = colors.text, bg = colors.mantle },
            NeoTreeTabInactive = { fg = colors.surface2, bg = colors.crust },
            NeoTreeTabSeparatorActive = { fg = colors.mantle, bg = colors.mantle },
            NeoTreeTabSeparatorInactive = { fg = colors.crust, bg = colors.crust },
            NeoTreeWinSeparator = { fg = colors.base, bg = colors.base },

            TelescopePreviewBorder = { bg = colors.crust, fg = colors.crust },
            TelescopePreviewNormal = { bg = colors.crust },
            TelescopePreviewTitle = { fg = colors.crust, bg = colors.crust },
            TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
            TelescopePromptCounter = { fg = colors.mauve, style = { "bold" } },
            TelescopePromptNormal = { bg = colors.surface0 },
            TelescopePromptPrefix = { bg = colors.surface0 },
            TelescopePromptTitle = { fg = colors.surface0, bg = colors.surface0 },
            TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
            TelescopeResultsNormal = { bg = colors.mantle },
            TelescopeResultsTitle = { fg = colors.mantle, bg = colors.mantle },
            TelescopeSelection = { bg = colors.surface0 },

            WhichKeyFloat = { bg = colors.mantle },

            IblIndent = { fg = colors.surface0 },
            IblScope = { fg = colors.overlay0 },

            MasonNormal = { bg = colors.mantle },
            MasonMutedBlock = { link = "CursorLine" },

            LazyNormal = { bg = colors.mantle },
          }
        end,
        latte = function(colors)
          return {
            LineNr = { fg = colors.surface1 },

            IblIndent = { fg = colors.mantle },
            IblScope = { fg = colors.surface1 },
          }
        end,
      },
    })
  end,
}
