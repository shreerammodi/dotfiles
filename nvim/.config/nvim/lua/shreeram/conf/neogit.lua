require("neogit").setup({
	signs = {
		-- { CLOSED, OPENED }
		hunk = { "", "" },
		item = { "", "" },
		section = { "", "" },
	},
})

vim.keymap.set("n", "<leader>gg", "<CMD>Neogit<CR>")
