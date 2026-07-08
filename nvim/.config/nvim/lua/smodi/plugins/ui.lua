add({
    { src = gh("catppuccin/nvim"), name = "catppuccin" }
})

require("catppuccin").setup({
    integrations = {
        neogit = true,
    }
})

vim.cmd.colorscheme("catppuccin-nvim")
