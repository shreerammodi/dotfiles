return {
    "nvim-treesitter/nvim-treesitter",
    version = "0.9.3",
    event = "VeryLazy",
    config = function()
        require("shreeram.conf.treesitter")
    end,
}
