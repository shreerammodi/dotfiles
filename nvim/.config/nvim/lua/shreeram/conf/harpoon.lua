local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set(
    "n",
    "<leader>bm", function()
        harpoon:list():add()
    end,
    { desc = "Add to harpoon" }
)

vim.keymap.set(
    "n",
    "<leader><return>",
    function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
    end,
    { desc = "Harpoon list" }
)

vim.keymap.set(
    "n",
    "<leader>1",
    function()
        harpoon:list():select(1)
    end,
    { desc = "Harpoon goto 1" }
)

vim.keymap.set(
    "n",
    "<leader>2",
    function()
        harpoon:list():select(2)
    end,
    { desc = "Harpoon goto 2" }
)

vim.keymap.set(
    "n",
    "<leader>3",
    function()
        harpoon:list():select(3)
    end,
    { desc = "Harpoon goto 3" }
)

vim.keymap.set(
    "n",
    "<leader>4",
    function()
        harpoon:list():select(4)
    end,
    { desc = "Harpoon goto 4" }
)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set(
    "n",
    "<leader>bp",
    function()
        harpoon:list():prev()
    end,
    { desc = "Harpoon previous" }
)

vim.keymap.set(
    "n",
    "<leader>bn",
    function()
        harpoon:list():next()
    end,
    { desc = "Harpoon next" }
)
