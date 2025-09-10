return {
    "folke/trouble.nvim",
    version = "3.7.1",
    opts = {},
    cmd = "Trouble",
    keys = {
        {
            "<leader>ld",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Diagnostics",
        },
        {
            "<leader>lD",
            "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
            desc = "Buffer Diagnostics",
        },
        {
            "<leader>cs",
            "<cmd>Trouble symbols toggle focus=false<cr>",
            desc = "Symbols (Trouble)",
        },
        {
            "<leader>ll",
            "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
            desc = "LSP Definitions / references / ...",
        },
        {
            "<leader>lL",
            "<cmd>Trouble loclist toggle<cr>",
            desc = "Location List",
        },
        {
            "<leader>lf",
            "<cmd>Trouble qflist toggle<cr>",
            desc = "Quickfix List",
        },
        {
            "<leader>ls",
            "<cmd>Trouble symbols toggle<cr>",
            desc = "Symbols",
        },
    },
}
