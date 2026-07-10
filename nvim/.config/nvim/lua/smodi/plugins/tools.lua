add({
    gh("stevearc/oil.nvim"),
    gh("folke/trouble.nvim"),
    gh("folke/which-key.nvim"),
    gh("nvim-telescope/telescope.nvim"),
    gh("nvim-lua/plenary.nvim")
})

local builtin = require("telescope.builtin")

map("n", "<leader>.", function()
    builtin.find_files()
end, { desc = "Find File" })
map("n", "<leader>ff", function()
    builtin.find_files()
end, { desc = "Find File" })

map("n", "<leader><leader>", function()
    builtin.git_files()
end, { desc = "Find Project File" })
map("n", "<leader>pf", function()
    builtin.git_files()
end, { desc = "Find Project File" })

map("n", "<leader>/", function()
    builtin.live_grep()
end, { desc = "Grep" })

map({ "n", "x" }, "<leader>sw", function()
    builtin.grep_string()
end, { desc = "Grep word" })

map("n", '<leader>s"', function()
    builtin.registers()
end, { desc = "Registers" })

map("n", "<leader>,", function()
    builtin.buffers()
end, { desc = "Buffers" })

require("oil").setup({
    default_file_explorer = true,
    delete_to_trash = true,
})

map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

require("trouble").setup()

require("which-key").setup()
