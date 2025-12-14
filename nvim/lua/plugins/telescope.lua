-- Plugin to allow searching for files and live grepping for file contents
return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "v0.2.0",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			-- set ctrl p tp open search
			vim.keymap.set("n", "<C-p>", builtin.find_files, {})
			-- set live grep to leader fg, which in tutorial was space bar. Is set at the top
			vim.keymap.set("n", "<C-f>", builtin.live_grep, {})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
