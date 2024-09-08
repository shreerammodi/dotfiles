local luasnip = require("luasnip")

vim.keymap.set({ "x", "i" }, "<C-e>", function() luasnip.change_choice(1) end)
vim.keymap.set({ "x", "i" }, "<C-y>", function() luasnip.change_choice(-1) end)
