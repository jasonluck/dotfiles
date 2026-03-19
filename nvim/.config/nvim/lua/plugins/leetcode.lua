-- INSTRUCTIONS FOR LEETCODE LOGIN
-- Login to Leetcode in your browser (Chrome)
-- Open DevTools (F12) and go to the Network tab.
-- Refresh the page and click on any request (e.g., graphql).
-- Go to Headers -> Request Headers -> cookie to find the cookie string.
--
-- After running :Leet, select the sign-in option and paste the cookie header value

return {
	"kawre/leetcode.nvim",
	build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		-- include a picker of your choice, see picker section for more details
		"nvim-telescope/telescope.nvim",
		-- optional
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		-- configuration goes here
		lang = "golang",
		picker = "telescope",
	},
}
