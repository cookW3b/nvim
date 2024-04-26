return {
	"nvimtools/none-ls.nvim",
	event = { "bufreadpre", "bufnewfile" },
	dependencies = { "mason.nvim", "davidmh/cspell.nvim" },
	opts = function()
		local nls = require("null-ls")
		local cspell = require("cspell")
		return {
			sources = {
				nls.builtins.formatting.stylua,
				cspell.diagnostics.with({
					diagnostics_postprocess = function(diagnostic)
						diagnostic.severity = vim.diagnostic.severity.HINT
					end,
				}),
				cspell.code_actions,
			},
		}
	end,
}
