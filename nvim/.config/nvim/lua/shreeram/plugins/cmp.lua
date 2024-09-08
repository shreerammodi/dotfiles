return {
    "hrsh7th/nvim-cmp",
    commit = "ae644feb7b67bf1ce4260c231d1d4300b19c6f30",
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
