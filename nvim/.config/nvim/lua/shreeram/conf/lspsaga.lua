require("lspsaga").setup({
	lightbulb = {
		enable = false,
	},
})

vim.keymap.set("n", "<leader>lr", "<CMD>Lspsaga rename<CR>", { desc = "Switch buffer" })
