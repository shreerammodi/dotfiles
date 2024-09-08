return {
	"nvimdev/lspsaga.nvim",
	commit = "4ce44df854f447cf0a8972e5387b3aeb5efc798b",
	dependencies = {
		{ "nvim-lspconfig", opt = true },
		{ "echasnovski/mini.icons", opt = true },
	},
	event = "LspAttach",
	config = function()
		require("shreeram.conf.lspsaga")
	end,
}
