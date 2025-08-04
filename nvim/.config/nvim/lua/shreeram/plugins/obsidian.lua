return {
    "epwalsh/obsidian.nvim",
    version = "3.9.0",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        workspaces = {
            {
                name = "notes",
                path = "~/Documents/notes",
            },
        }
    }
}
