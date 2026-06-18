return {
	"projekt0n/github-nvim-theme",
	version = "1.1.2",
	priority = 1000,
	config = function()
		require("github-theme").setup({
			options = {
				transparent = true,
				styles = {
					comments = "italic",
				},
				inverse = {
					visual = false,
				},
				modules = {
					cmp = { enable = true },
					dapui = { enable = true },
					gitsigns = { enable = true },
					native_lsp = { enable = true },
					neogit = { enable = true },
					treesitter = { enable = true },
					whichkey = { enable = true },
				},
			},
		})
		vim.cmd("colorscheme github_dark_default")
	end,
}
