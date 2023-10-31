vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Tree Sitter
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

  -- THEMES
  use { "catppuccin/nvim", as = "catppuccin" }
  use { 'EdenEast/nightfox.nvim' }
  use { 'rose-pine/neovim' }
  use { 'sainnhe/everforest' }
  use { 'sainnhe/sonokai' }
  use { "folke/tokyonight.nvim" }
  use { "yazeed1s/oh-lucy.nvim" }

  use {
    'HiPhish/rainbow-delimiters.nvim'
  }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    }
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use "sindrets/diffview.nvim"

  -- Terminal
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
  end}

  -- LSP
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v2.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},

      -- Icons
      {'onsails/lspkind.nvim'}
	  }
  }

  -- Troubles
  use({
    "folke/trouble.nvim",
    config = function()
        require("trouble").setup {
            icons = false,
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    end
  })

  use {'kevinhwang91/nvim-bqf'}

  -- Comments
  use 'numToStr/Comment.nvim'

  -- Colorizer
  use 'norcalli/nvim-colorizer.lua'

  -- Paint
  use({
    "folke/paint.nvim",
    config = function()
      require("paint").setup({
        ---@type PaintHighlight[]
        highlights = {
          {
            -- filter can be a table of buffer options that should match,
            -- or a function called with buf as param that should return true.
            -- The example below will paint @something in comments with Constant
            filter = { filetype = "lua" },
            pattern = "%s*%-%-%-%s*(@%w+)",
            hl = "Constant",
          },
          {
            filter = { filetype = "python" },
            pattern = "%s*([_%w]+:)",
            hl = "Constant",
          },
        },
      })
    end,
  })

  -- Autopairs
  use "windwp/nvim-autopairs"

  -- Magit
  use 'NeogitOrg/neogit'

  -- Status line
  -- use { "nvim-lualine/lualine.nvim" }
  use 'freddiehaddad/feline.nvim'

  -- Markdown
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  -- TODO
  use "folke/todo-comments.nvim"

  use "lukas-reineke/indent-blankline.nvim"
end)
