return {
    "NeogitOrg/neogit",
    lazy = true,
    dependencies = {
        "esmuellert/codediff.nvim",
    },
    keys = {
        {
            "<leader>gg",
            function()
                require("neogit").open()
            end,
            desc = "Show Neogit UI",
        },
    },
    cmd = { "Neogit" },
    opts = {
        signs = {
            -- { CLOSED, OPENED }
            hunk = { "", "" },
            item = { "", "" },
            section = { "", "" },
        },
    },
}
