return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				auto_install = true,
				ensure_installed = {
					"lua",
					"hcl",
					"yaml",
					"terraform",
					"bash",
					"markdown",
					"vim",
					"json",
					"java",
					"go",
					"gomod",
					"gowork",
					"gosum",
				},
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
