return {
    "ggandor/leap.nvim",
    commit = "8b826a9fc766bffd14288aee01847cb0d6c6c383",
    dependencies = {
        { "tpope/vim-repeat", opt = true },
    },
    config = function()
        require("shreeram.conf.leap")
    end,
}
