add({
	gh("projekt0n/github-nvim-theme"),
})

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
		},
	},
})

vim.cmd.colorscheme("github_dark_default")
