add({ gh("nvim-mini/mini.nvim") })

require("mini.surround").setup()

require("mini.ai").setup()

require("mini.jump2d").setup({
    labels = "arstdhneiowfpluyxcvm,.",
})

require("mini.statusline").setup()

require("mini.icons").setup()

require("mini.pairs").setup({
    -- skip autopair when next character is one of these
    skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
    -- skip autopair when next character is closing pair
    -- and there are more closing pairs than opening pairs
    skip_unbalanced = true,
})
