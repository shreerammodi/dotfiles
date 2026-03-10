return {
    "karb94/neoscroll.nvim",
    commit = "c8d29979cb0cb3a2437a8e0ae683fd82f340d3b8",
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
