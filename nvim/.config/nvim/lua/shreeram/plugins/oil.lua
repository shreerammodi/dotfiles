return {
	"stevearc/oil.nvim",
	version = "2.12.1",
	dependencies = { { "echasnovski/mini.icons", opt = true } },
	keys = { "-" },
	cmd = "Oil",
	config = function()
		require("shreeram.conf.oil")
		require("oil").setup({
			default_file_explorer = true,
			delete_to_trash = true,
		})
	end,
}
