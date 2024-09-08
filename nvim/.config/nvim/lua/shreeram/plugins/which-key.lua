return {
	"folke/which-key.nvim",
	version = "3.13.2",
	event = "VeryLazy",
	config = function()
		require("shreeram.conf.which-key")
	end,
}
