local zk = require("zk.commands")

vim.keymap.set(
    "n",
    "<leader>nb",
    function()
        zk.get("ZkBacklinks")()
    end,
    { desc = "Browse backlinks" }
)

vim.keymap.set(
    "n",
    "<leader>nf",
    function()
        zk.get("ZkNotes")()
    end,
    { desc = "Browse notes" }
)

vim.keymap.set(
    "n",
    "<leader>ni",
    function()
        zk.get("ZkInsertLink")()
    end,
    { desc = "Insert link" }
)

vim.keymap.set(
    "x",
    "<leader>ni",
    function()
        zk.get("ZkInsertLink")()
    end,
    { desc = "Insert link at selection" }
)

vim.keymap.set(
    "n",
    "<leader>nn",
    function()
        zk.get("ZkNew")({ title = vim.fn.input("Title: ") })
    end,
    { desc = "New note" }
)
