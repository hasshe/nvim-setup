return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons", -- optional, but recommended
	},
	config = function()
		vim.keymap.set("n", "<leader>f", ":Neotree filesystem reveal left<CR>", {})
		vim.keymap.set("n", "<leader>h", ":Neotree filesystem toggle left<CR>", {})
	end,
}
