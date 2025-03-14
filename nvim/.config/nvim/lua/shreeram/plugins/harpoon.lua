return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    commit = "ed1f853847ffd04b2b61c314865665e1dadf22c7",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("shreeram.conf.harpoon")
    end,
}
