return {
	"nvimtools/none-ls.nvim",
	-- 1. Must include the extras plugin as a dependency
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				-- Standard builtins (no change needed)
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.completion.spell,

				-- 2. CRITICAL FIX: Must use 'require' syntax for eslint_d
				require("none-ls.diagnostics.eslint_d"),
			},
		})

		-- Set up a keymap for formatting (using none-ls when available)
		vim.keymap.set("n", "<leader>gf", function()
			-- Calls Lsp format, which none-ls should hook into
			vim.lsp.buf.format({ async = true })
		end, { desc = "Format file" })
	end,
}
