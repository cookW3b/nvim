require("catppuccin").setup({
  flavour = "mocha", -- Can be one of: latte, frappe, macchiato, mocha
  background = { light = "latte", dark = "mocha" },
  dim_inactive = {
    enabled = false,
    -- Dim inactive splits/windows/buffers.
    -- NOT recommended if you use old palette (a.k.a., mocha).
    shade = "dark",
    percentage = 0.15,
  },
  show_end_of_buffer = false, -- show the '~' characters after the end of buffers
  term_colors = true,
  compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
  styles = {
    comments = { "italic" },
    functions = { "bold" },
    keywords = { "bold" },
    operators = { "bold" },
    conditionals = { "bold" },
    loops = { "bold" },
    booleans = { "bold", "italic" },
    numbers = {},
    types = {},
    strings = {},
    variables = {},
  },
  integrations = {
    treesitter = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
      },
    },
    aerial = false,
    alpha = false,
    barbar = false,
    beacon = false,
    cmp = true,
    coc_nvim = false,
    dap = { enabled = true, enable_ui = true },
    dashboard = false,
    dropbar = { enabled = true, color_mode = true },
    fern = false,
    fidget = true,
    flash = false,
    gitgutter = false,
    gitsigns = true,
    harpoon = false,
    headlines = false,
    hop = true,
    illuminate = true,
    indent_blankline = { enabled = true, colored_indent_levels = false },
    leap = false,
    lightspeed = false,
    lsp_saga = true,
    lsp_trouble = true,
    markdown = true,
    mason = true,
    mini = false,
    navic = { enabled = false },
    neogit = false,
    neotest = false,
    neotree = { enabled = false, show_root = true, transparent_panel = false },
    noice = false,
    notify = true,
    nvimtree = true,
    overseer = false,
    pounce = false,
    rainbow_delimiters = true,
    sandwich = false,
    semantic_tokens = true,
    symbols_outline = true,
    telekasten = false,
    telescope = { enabled = true, style = "nvchad" },
    treesitter_context = true,
    ts_rainbow = false,
    vim_sneak = false,
    vimwiki = false,
    which_key = true,
  },
  color_overrides = {
    mocha = {
      {
        rosewater = "#DC8A78",
        flamingo = "#DD7878",
        mauve = "#CBA6F7",
        pink = "#F5C2E7",
        red = "#E95678",
        maroon = "#B33076",
        peach = "#FF8700",
        yellow = "#F7BB3B",
        green = "#AFD700",
        sapphire = "#36D0E0",
        blue = "#61AFEF",
        sky = "#04A5E5",
        teal = "#B5E8E0",
        lavender = "#7287FD",

        text = "#F2F2BF",
        subtext1 = "#BAC2DE",
        subtext0 = "#A6ADC8",
        overlay2 = "#C3BAC6",
        overlay1 = "#988BA2",
        overlay0 = "#6E6B6B",
        surface2 = "#6E6C7E",
        surface1 = "#575268",
        surface0 = "#302D41",

        base = "#1D1536",
        mantle = "#1C1C19",
        crust = "#161320",
      }
    }
  },
  custom_highlights =
    function (colors)
      return {
        CursorLineNr = { fg = colors.lavender }
      }
    end
})

-- setup must be called before loading
-- vim.cmd.colorscheme "catppuccin"
