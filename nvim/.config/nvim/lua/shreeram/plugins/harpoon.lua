return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	commit = "0378a6c428a0bed6a2781d459d7943843f374bce",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("shreeram.conf.harpoon")
	end,
}
