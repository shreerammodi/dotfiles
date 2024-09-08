return {
	"nvim-treesitter/nvim-treesitter",
	commit = "bfe74a4899882a4ef45abb80813f14644a110a34",
	event = "VeryLazy",
	config = function()
		require("shreeram.conf.treesitter")
	end,
}
