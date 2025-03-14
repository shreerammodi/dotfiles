return {
    "mbbill/undotree",
    commit = "2556c6800b210b2096b55b66e74b4cc1d9ebbe4f",
    keys = { "<leader>su", desc = "Undo history" },
    cmd = "UndotreeToggle",
    config = function()
        vim.keymap.set("n", "<leader>su", "<CMD>UndotreeToggle<CR>", { desc = "Undo history" })
    end,
}
