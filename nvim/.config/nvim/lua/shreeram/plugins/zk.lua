return {
    "zk-org/zk-nvim",
    config = function()
        require("zk").setup({
            picker = "telescope",
            picker_options = {
                telescope = require("telescope.themes").get_ivy(),
            }
        })
        require("shreeram.conf.zk")
    end
}
