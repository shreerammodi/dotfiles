add({
    gh("NeogitOrg/neogit"),
    gh("esmuellert/codediff.nvim"),
    gh("lewis6991/gitsigns.nvim"),
})

require("neogit").setup({
    signs = {
        -- { CLOSED, OPENED }
        hunk = { "", "" },
        item = { "", "" },
        section = { "", "" },
    },
})

require("gitsigns").setup({
    on_attach = function(bufnr)
        local gitsigns = require("gitsigns")
        local map = vim.keymap.set

        map({ "n", "x" }, "<leader>grh", function()
            gitsigns.reset_hunk()
        end, { desc = "Reset hunk" })

        map({ "n", "x" }, "<leader>grb", function()
            gitsigns.reset_buffer()
        end, { desc = "Reset buffer" })

        map({ "n", "x" }, "<leader>gsh", function()
            gitsigns.stage_hunk()
        end, { desc = "Stage hunk" })

        map({ "n", "x" }, "<leader>gsb", function()
            gitsigns.stage_buffer()
        end, { desc = "Stage buffer" })

        map({ "n", "x" }, "<leader>gbb", function()
            gitsigns.blame()
        end, { desc = "Blame Buffer" })

        map({ "n", "x" }, "<leader>gbl", function()
            gitsigns.blame_line()
        end, { desc = "Blame Line" })

        map("n", "]h", function()
            gitsigns.nav_hunk("next")
        end, { desc = "Next hunk" })

        map("n", "[h", function()
            gitsigns.nav_hunk("prev")
        end, { desc = "Previous hunk" })

        map({ "o", "x" }, "ih", function()
            gitsigns.select_hunk()
        end, { desc = "Select Hunk" })
    end,
})

vim.keymap.set("n", "<leader>gg", function()
    require("neogit").open()
end, { desc = "Show Neogit UI" })
