return {
    "NeogitOrg/neogit",
    commit = "63124cf520ff24d09deb3b850e053908ab0fc66a",
    dependencies = {
        { "nvim-lua/plenary.nvim",  lazy = true },
        { "sindrets/diffview.nvim", lazy = true },
    },
    config = function()
        require("shreeram.conf.neogit")
    end,
    keys = { "<leader>gg" },
    cmd = { "Neogit" },
}
