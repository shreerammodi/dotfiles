return {
    "nvim-treesitter/nvim-treesitter",
    version = "10.0.0",
    event = "VeryLazy",
    config = function()
        require("shreeram.conf.treesitter")
    end,
    build = ":TSUpdate"
}
