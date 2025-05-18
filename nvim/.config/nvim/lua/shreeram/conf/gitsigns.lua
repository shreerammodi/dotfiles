require("gitsigns").setup({
	on_attach = function(bufnr)
		local gitsigns = require("gitsigns")

		vim.keymap.set({ "n", "x" }, "<leader>grh", function()
			gitsigns.reset_hunk()
		end, { desc = "Reset hunk" })

		vim.keymap.set({ "n", "x" }, "<leader>grb", function()
			gitsigns.reset_buffer()
		end, { desc = "Reset buffer" })

		vim.keymap.set("n", "]h", function()
			gitsigns.nav_hunk("next")
		end, { desc = "Next hunk" })

		vim.keymap.set("n", "[h", function()
			gitsigns.nav_hunk("prev")
		end, { desc = "Previous hunk" })
	end,
})
