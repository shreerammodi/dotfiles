return {
    "folke/which-key.nvim",
    version = "3.16.0",
    event = "VeryLazy",
    config = function()
        require("shreeram.conf.which-key")
    end,
}
