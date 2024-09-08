return {
	"mbbill/undotree",
	commit = "56c684a805fe948936cda0d1b19505b84ad7e065",
	keys = { "<leader>su", desc = "Undo history" },
	cmd = "UndotreeToggle",
	config = function()
		vim.keymap.set("n", "<leader>su", "<CMD>UndotreeToggle<CR>", { desc = "Undo history" })
	end,
}
