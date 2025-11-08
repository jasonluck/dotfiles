return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"terraformls",
					"jdtls",
					"gopls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.terraformls.setup({})
			lspconfig.gopls.setup({})
		end,
	},
	-- Plugin for Java LSP
	{
		"mfussenegger/nvim-jdtls",
		config = function() end,
	},
}
