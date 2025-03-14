return {
    "hrsh7th/nvim-cmp",
    commit = "12509903a5723a876abd65953109f926f4634c30",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
    },
    config = function()
        require("shreeram.conf.cmp")
    end,
}
