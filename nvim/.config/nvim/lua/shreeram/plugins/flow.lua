return {
    dir = "/Users/shreeram/Documents/src/nvim-flow/",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("flow").setup({
            column_width = 30,
            save_on_switch = true,
            python_path = "python3",
        })
    end,
}
