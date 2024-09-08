local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set("n", "<leader>bm", function()
	harpoon:list():add()
end)

vim.keymap.set("n", "<leader><return>", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<leader>1", function()
	harpoon:list():select(1)
end)

vim.keymap.set("n", "<leader>2", function()
	harpoon:list():select(2)
end)

vim.keymap.set("n", "<leader>3", function()
	harpoon:list():select(3)
end)

vim.keymap.set("n", "<leader>4", function()
	harpoon:list():select(4)
end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<leader>bp", function()
	harpoon:list():prev()
end)

vim.keymap.set("n", "<leader>bn", function()
	harpoon:list():next()
end)
