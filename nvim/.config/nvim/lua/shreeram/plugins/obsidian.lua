return {
    "obsidian-nvim/obsidian.nvim",
    version = "*",
    keys = {
        { "<leader>nD", "<CMD>Obsidian today<CR>", desc = "Today's daily" },
        { "<leader>nd", "<CMD>Obsidian dailies<CR>", desc = "Daily notes" },
        { "<leader>nf", "<CMD>Obsidian quick_switch<CR>", desc = "Find note" },
        {
            "<leader>nn",
            function()
                vim.ui.input({ prompt = "Note title: " }, function(title)
                    if title then
                        vim.cmd("Obsidian new " .. title)
                    end
                end)
            end,
            desc = "New note",
        },
        { "<leader>ns", "<CMD>Obsidian search<CR>", desc = "Search vault" },
    },
    opts = {
        frontmatter = {
            enabled = false,
        },
        note_id_func = function(title)
            -- Use the note's title as its filename
            if title ~= nil then
                return title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", "")
            end
            return tostring(os.time())
        end,
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
    },
}
