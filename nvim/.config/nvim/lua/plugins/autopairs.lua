return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {}, -- this is equalent to setup({}) function
  },

  --Tabout plugin to allow us to tab out of our autopaired brackets, quotes, ..
  -- This was conflicting with CoPilot, so disabling for now
  {
  	"abecodes/tabout.nvim",
  	config = function()
  		require("tabout").setup()
  	end,
  },
}
