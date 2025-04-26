require("lspsaga").setup({
    lightbulb = {
        enable = false,
    },
})

vim.diagnostic.config({
    severity_sort = true,
})

vim.keymap.set("n", "<leader>lr", "<CMD>Lspsaga rename<CR>", { desc = "Rename" })

vim.keymap.set("n", "<leader>ll", "<CMD>Lspsaga show_line_diagnostics<CR>", { desc = "Line Diagnostics" })
vim.keymap.set("n", "<leader>lc", "<CMD>Lspsaga show_cursor_diagnostics<CR>", { desc = "Cursor Diagnostics" })
vim.keymap.set("n", "<leader>lb", "<CMD>Lspsaga show_buf_diagnostics<CR>", { desc = "Buffer Diagnostics" })

vim.keymap.set("n", "<leader>lo", "<CMD>Lspsaga outline<CR>", { desc = "Outline" })
vim.keymap.set("n", "<leader>la", "<CMD>Lspsaga code_action<CR>", { desc = "Code Action" })
vim.keymap.set("n", "<leader>lh", "<CMD>Lspsaga hover_doc<CR>", { desc = "Hover Doc" })
vim.keymap.set("n", "<leader>lf", "<CMD>Lspsaga finder<CR>", { desc = "Finder" })

vim.keymap.set("n", "<leader>li", "<CMD>Lspsaga diagnostic_jump_next<CR>", { desc = "Next Diagnostic" })
vim.keymap.set("n", "<leader>lo", "<CMD>Lspsaga diagnostic_jump_prev<CR>", { desc = "Prev Diagnostic" })

vim.keymap.set("n", "<leader>ldg", "<CMD>Lspsaga goto_definition<CR>", { desc = "Goto Definition" })
vim.keymap.set("n", "<leader>ldp", "<CMD>Lspsaga peek_definition<CR>", { desc = "Peek Definition" })
