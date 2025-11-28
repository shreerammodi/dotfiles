return {
    "obsidian-nvim/obsidian.nvim",
    version = "3.14.2",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    cmd = "Obsidian",
    keys = {
        { "<leader>nD", "<CMD>Obsidian today<CR>",        desc = "Today's daily" },
        { "<leader>nd", "<CMD>Obsidian dailies<CR>",      desc = "Daily notes" },
        { "<leader>nf", "<CMD>Obsidian quick_switch<CR>", desc = "Find note" },
        {
            "<leader>nn",
            function()
                vim.ui.input({ prompt = "Note title: " },
                    function(title) if title then vim.cmd("Obsidian new " .. title) end end)
            end,
            desc = "New note"
        },
        { "<leader>ns", "<CMD>Obsidian switch<CR>", desc = "Search vault" },
    },
    opts = {
        frontmatter = {
            enabled = false
        },
        legacy_commands = false,
        picker = { name = snacks },
        workspaces = {
            {
                name = "notes",
                path = "~/Documents/notes",
            },
        },
        daily_notes = {
            folder = "daily/",
        },
    }
}
