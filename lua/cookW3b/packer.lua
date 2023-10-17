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

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

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

  -- Comments
  use 'numToStr/Comment.nvim'

  -- Colorizer
  use 'norcalli/nvim-colorizer.lua'

  -- Autopairs
  use "windwp/nvim-autopairs"

  -- Magit
  use 'NeogitOrg/neogit'

  -- Neorg
  use {
    "nvim-neorg/neorg",
    config = function()
      require('neorg').setup {
        load = {
          ["core.defaults"] = {},        -- Loads default behaviour
          ["core.concealer"] = {},       -- Adds pretty icons to your documents
          ["core.dirman"] = {            -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/notes",
              },
            },
          },
        },
      }
    end,
    run = ":Neorg sync-parsers",
    requires = "nvim-lua/plenary.nvim",
  }

  -- Status line
  use { "nvim-lualine/lualine.nvim" }

  -- Markdown
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  use "lukas-reineke/indent-blankline.nvim"
end)
