local zk = require("zk.commands")

vim.keymap.set(
    "n",
    "<leader>nf",
    function()
        zk.get("ZkNotes")
    end,
    { desc = "Browse notes" }
)

vim.keymap.set(
    "n",
    "<leader>nn",
    function()
        zk.get("ZkNew")({ title = vim.fn.input("Title: ") })
    end,
    { desc = "New note" }
)
