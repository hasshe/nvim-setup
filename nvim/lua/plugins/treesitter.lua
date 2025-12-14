-- Plugin to provide syntax highlighting for selected languages
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
      auto_install = true,
			ensure_installed = { "lua", "javascript", "rust" },
			highlight = { enalble = true },
			indent = { enable = true },
		})
	end,
}
