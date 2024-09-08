return {
	"NeogitOrg/neogit",
	commit = "9bc4ee89bb42be31a2f0b1da41e36e3e6cab9bbb",
	dependencies = {
		{ "nvim-lua/plenary.nvim", lazy = true },
		{ "sindrets/diffview.nvim", lazy = true },
		{ "nvim-telescope/telescope.nvim", lazy = true },
	},
	config = function()
		require("shreeram.conf.neogit")
	end,
	keys = { "<leader>gg" },
	cmd = { "Neogit" },
}
