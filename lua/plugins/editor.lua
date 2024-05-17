return {
	{
		"lewis6991/gitsigns.nvim",
    config = function()
      local gitsigns = require("gitsigns")
      gitsigns.setup {}

      vim.keymap.set("n", "<leader>bl", gitsigns.blame_line, { desc = "Next git hunk" })
    end
	},
	{
		"mbbill/undotree",
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	{
		"toppair/peek.nvim",
		event = { "VeryLazy" },
		build = "deno task --quiet build:fast",
		config = function()
			require("peek").setup({
				app = { "firefox", "--new-window" },
			})
			vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
			vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
		end,
	},
	{
		"smoka7/multicursors.nvim",
		event = "VeryLazy",
		dependencies = {
			"smoka7/hydra.nvim",
		},
		opts = {},
		cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
		keys = {
			{
				mode = { "v", "n" },
				"<leader>m",
				"<cmd>MCstart<cr>",
				desc = "Create a selection for selected text or word under the cursor",
			},
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				sections = {
					lualine_c = { "filename" },
					lualine_x = {
						-- {
						--   require("noice").api.status.message.get_hl,
						--   cond = require("noice").api.status.message.has,
						-- },
						{
							require("noice").api.status.command.get,
							cond = require("noice").api.status.command.has,
							color = { fg = "#ff9e64" },
						},
						{
							require("noice").api.status.mode.get,
							cond = require("noice").api.status.mode.has,
							color = { fg = "#ff9e64" },
						},
						{
							require("noice").api.status.search.get,
							cond = require("noice").api.status.search.has,
							color = { fg = "#ff9e64" },
						},
					},
				},
			})
		end,
	},
	-- lazy.nvim
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		init = function()
			vim.keymap.set("n", "<leader>nd", ":NoiceDismiss<cr>")
		end,
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},

	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({})
		end,
	},

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}, -- this is equalent to setup({}) function
	},

	{
		"nvim-tree/nvim-web-devicons",
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")

			-- REQUIRED
			harpoon:setup()
			-- REQUIRED

			vim.keymap.set("n", "<leader>a", function()
				harpoon:list():add()
			end)
			vim.keymap.set("n", "<TAB>", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end)

			vim.keymap.set("n", "<C-h>", function()
				harpoon:list():select(1)
			end)
			vim.keymap.set("n", "<C-j>", function()
				harpoon:list():select(2)
			end)
			vim.keymap.set("n", "<C-m>", function()
				harpoon:list():select(3)
			end)
			vim.keymap.set("n", "<C-l>", function()
				harpoon:list():select(4)
			end)

			-- Toggle previous & next buffers stored within Harpoon list
			vim.keymap.set("n", "<C-S-P>", function()
				harpoon:list():prev()
			end)
			vim.keymap.set("n", "<C-S-N>", function()
				harpoon:list():next()
			end)
		end,
	},

	{
		"stevearc/aerial.nvim",
		opts = {
			backends = {
				["_"] = { "lsp", "treesitter" },
				python = { "treesitter" },
				rust = { "treesitter" },
				js = { "treesitter" },
			},
			layout = {
				width = 40,
				min_width = 40,
			},
		},
		-- Optional dependencies
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		init = function()
			vim.keymap.set("n", "<leader>t", ":AerialToggle<cr>")
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		lazy = true,
		config = function()
			local highlight = {
				"RainbowRed",
			}
			local hooks = require("ibl.hooks")
			-- create the highlight groups in the highlight setup hook, so they are reset
			-- every time the colorscheme changes
			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
			end)
			require("ibl").setup({
				indent = {
					char = "│",
				},
				scope = {
					highlight = highlight,
					show_exact_scope = true,
					include = {
						node_type = { ["*"] = { "*" } },
					},
				},
			})
			-- require("ibl").setup {
			--   indent = { highlight = highlight, char = "." },
			--   whitespace = {
			--     highlight = highlight,
			--     remove_blankline_trail = false,
			--   },
			--   scope = { enabled = false },
			-- }
		end,
	},

  {
    "nvim-treesitter/nvim-treesitter-context"
  },

	{
		"Bekaboo/dropbar.nvim",
    lazy = true,
		config = function()
			require("dropbar").setup({})
		end,
		-- optional, but required for fuzzy finder support
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
		},
	},

	{
		"numToStr/Comment.nvim",
		opts = {
			-- add any options here
		},
		lazy = false,
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		init = function()
			vim.keymap.set("n", "<leader>xx", ":TroubleToggle<cr>")
			vim.keymap.set("n", "<leader>xw", ":TroubleToggle workspace_diagnostics<cr>")
			vim.keymap.set("n", "<leader>xd", ":TroubleToggle document_diagnostics<cr>")
		end,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
}
