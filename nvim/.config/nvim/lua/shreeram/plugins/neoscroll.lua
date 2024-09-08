return {
	"karb94/neoscroll.nvim",
	commit = "6dfce64589e8e685d21f2dbd2df15a2473fa1d41",
	event = "WinScrolled",
	keys = {
		{ "<C-e>", mode = { "n", "v" } },
		{ "<C-y>", mode = { "n", "v" } },
		{ "<C-u>", mode = { "n", "v" } },
		{ "<C-d>", mode = { "n", "v" } },
		{ "<C-f>", mode = { "n", "v" } },
		{ "<C-b>", mode = { "n", "v" } },
		{ "zz", mode = { "n", "v" } },
		{ "zt", mode = { "n", "v" } },
		{ "zb", mode = { "n", "v" } },
	},
	opts = {},
	cond = function()
		return not vim.g.neovide
	end,
}
