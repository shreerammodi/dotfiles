return {
    "karb94/neoscroll.nvim",
    commit = "f957373912e88579e26fdaea4735450ff2ef5c9c",
    event = "WinScrolled",
    keys = {
        { "<C-e>", mode = { "n", "v" } },
        { "<C-y>", mode = { "n", "v" } },
        { "<C-u>", mode = { "n", "v" } },
        { "<C-d>", mode = { "n", "v" } },
        { "<C-f>", mode = { "n", "v" } },
        { "<C-b>", mode = { "n", "v" } },
        { "zz",    mode = { "n", "v" } },
        { "zt",    mode = { "n", "v" } },
        { "zb",    mode = { "n", "v" } },
    },
    opts = {},
    cond = function()
        return not vim.g.neovide
    end,
}
