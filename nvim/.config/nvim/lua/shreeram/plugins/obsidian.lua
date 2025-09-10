return {
    "epwalsh/obsidian.nvim",
    version = "3.9.0",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    cmd = "Obsidian",
    keys = {
        { "<leader>nd", desc = "Daily notes" },
        { "<leader>nD", desc = "Today's daily" },
        { "<leader>nt", desc = "Search tags" },
        { "<leader>ns", desc = "Search vault" },
        { "<leader>nf", desc = "Find note" },

    },
    config = function()
        require("shreeram.conf.obsidian")
    end,
}
