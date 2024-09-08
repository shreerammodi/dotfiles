vim.keymap.set("n", "s", "<Plug>(leap-forward)")
vim.keymap.set("n", "S", "<Plug>(leap-backward)")

vim.keymap.set({ "x", "o" }, "s", "<Plug>(leap-forward-to)")
vim.keymap.set({ "x", "o" }, "x", "<Plug>(leap-forward-till)")

vim.keymap.set({ "x", "o" }, "S", "<Plug>(leap-backward-to)")
vim.keymap.set({ "x", "o" }, "X", "<Plug>(leap-backward-till)")

vim.keymap.set({ "n", "x", "o" }, "zS", "<Plug>(leap-from-window)")
