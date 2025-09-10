require("obsidian").setup({
    disable_frontmatter = true,
    workspaces = {
        {
            name = "notes",
            path = "~/Documents/notes",
        },
    },
    daily_notes = {
        folder = "daily/",
        template = "00-SYSTEM/templates/Daily-Note-Template.md"
    }
})


vim.keymap.set("n", "<leader>nd", "<CMD>ObsidianDailies<CR>", { desc = "Daily notes" })

vim.keymap.set("n", "<leader>nD", "<CMD>ObsidianToday<CR>", { desc = "Today's daily" })

vim.keymap.set("n", "<leader>nt", "<CMD>ObsidianTags<CR>", { desc = "Search tags" })

vim.keymap.set("n", "<leader>ns", "<CMD>ObsidianSearch<CR>", { desc = "Search vault" })

vim.keymap.set("n", "<leader>nf", "<CMD>ObsidianQuickSwitch<CR>", { desc = "Find note" })
