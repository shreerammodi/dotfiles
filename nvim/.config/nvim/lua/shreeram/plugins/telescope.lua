return {
	"nvim-telescope/telescope.nvim",
	version = "0.1.8",
	cmd = "Telescope",
	keys = {
		{ "<leader>,", desc = "Switch buffer" },
		{ "<leader>.", desc = "Find file" },
		{ "<leader>/", desc = "Search project" },
		{ "<leader>bb", desc = "Switch buffer" },
		{ "<leader>ff", desc = "Find file" },
		{ "<leader>sWd", desc = "Search directory for WORD" },
		{ "<leader>sWp", desc = "Search project for WORD" },
		{ "<leader>sd", desc = "Search directory" },
		{ "<leader>sh", desc = "Search help tags" },
		{ "<leader>sp", desc = "Search project" },
		{ "<leader>swd", desc = "Search directory for word" },
		{ "<leader>swp", desc = "Search project for word" },
	},
	config = function()
		require("shreeram.conf.telescope")
	end,
}
