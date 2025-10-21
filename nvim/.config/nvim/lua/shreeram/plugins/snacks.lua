return {
    "folke/snacks.nvim",
    opts = {
        picker = {},
        explorer = {}
    },
    keys = {
        { "<leader>.",        function() Snacks.picker.files() end,     desc = "Find File" },
        { "<leader>ff",       function() Snacks.picker.files() end,     desc = "Find File" },
        { "<leader><leader>", function() Snacks.picker.git_files() end, desc = "Find File" },
        { "<leader>pf",       function() Snacks.picker.git_files() end, desc = "Find File" },
        { "<leader>/",        function() Snacks.picker.grep() end,      desc = "Grep" },
        { "<leader>sw",       function() Snacks.picker.grep_word() end, desc = "Grep word",   mode = { "n", "x" } },
        { "<leader>,",        function() Snacks.picker.buffers() end,   desc = "Buffers" },
        { "<leader>bb",       function() Snacks.picker.buffers() end,   desc = "Buffers" },
        { "<leader>su",       function() Snacks.picker.undo() end,      desc = "Undo History" },
        { '<leader>s"',       function() Snacks.picker.registers() end, desc = "Registers" },
        { "<leader>sh",       function() Snacks.picker.help() end,      desc = "Help Pages" },
    }
}
