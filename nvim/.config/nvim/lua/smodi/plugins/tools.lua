add({
	gh("dmtrKovalenko/fff.nvim"),
	gh("stevearc/oil.nvim"),
})

vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "fff.nvim" and kind == "update" then
			if not ev.data.active then
				vim.cmd.packadd("fff.nvim")
			end
			require("fff.download").download_or_build_binary()
		end
	end,
})

require("fff").setup()

local fff = require("fff")

map("n", "<leader><leader>", function()
	fff.find_files()
end, { desc = "Find File" })
map("n", "<leader>ff", function()
	fff.find_files()
end, { desc = "Find File" })

map("n", "<leader>/", function()
	require("fff").live_grep({ grep = { modes = { "fuzzy", "plain" } } })
end, { desc = "Live Grep" })

require("oil").setup({
	default_file_explorer = true,
	delete_to_trash = true,
})

map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
