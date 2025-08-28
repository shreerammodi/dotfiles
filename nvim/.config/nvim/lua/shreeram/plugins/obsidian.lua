return {
    "epwalsh/obsidian.nvim",
    version = "3.9.0",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        disable_frontmatter = true,
        workspaces = {
            {
                name = "notes",
                path = "~/Documents/notes",
            },
        }
    }
}
