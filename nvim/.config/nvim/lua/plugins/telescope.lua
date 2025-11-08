return {
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
	{
		"nvim-telescope/telescope-dap.nvim",
	},
	{
		"ANGkeith/telescope-terraform-doc.nvim",
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				defaults = {
					file_ignore_patterns = {
						".git/",
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
				pickers = {
					find_files = {
						hidden = true,
					},
				},
			})

			require("telescope").load_extension("ui-select")
			require("telescope").load_extension("dap")
			require("telescope").load_extension("terraform_doc")
		end,
	},
}
