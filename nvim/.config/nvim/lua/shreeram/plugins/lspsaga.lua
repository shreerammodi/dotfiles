return {
    "nvimdev/lspsaga.nvim",
    commit = "da8a66c53241876bba140980469876db3a183604",
    dependencies = {
        { "nvim-lspconfig",         opt = true },
        { "echasnovski/mini.icons", opt = true },
    },
    event = "LspAttach",
    config = function()
        require("shreeram.conf.lspsaga")
    end,
}
