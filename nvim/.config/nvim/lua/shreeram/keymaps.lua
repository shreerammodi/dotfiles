local map = vim.keymap.set

map("v", "<", "<gv")
map("v", ">", ">gv")

map({ "n", "x" }, "j", [[v:count ? "j" : "gj"]], { expr = true })
map({ "n", "x" }, "k", [[v:count ? "k" : "gk"]], { expr = true })

map("n", "<Leader>w", vim.cmd.write, { desc = "Write buffer" })
map("n", "<Leader>ww", vim.cmd.write, { desc = "Write buffer" })
map("n", "<Leader>wq", vim.cmd.wq, { desc = "Write buffer and quit" })

map("n", "<leader>co", vim.cmd.copen, { desc = "Open quickfixlist" })
map("n", "<leader>cn", vim.cmd.cnext, { desc = "Go to next error" })
map("n", "<leader>cp", vim.cmd.cprev, { desc = "Go to prev error" })

map(
    "i",
    "<C-l>",
    "<C-G>u<Esc>[s1z=`]a<C-G>u",
    { desc = "Correct spelling error" }
)

map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank into clipboard" })
map(
    "n",
    "<leader>Y",
    [[<cmd>%y +<cr>]],
    { desc = "Yank buffer into clipboard" }
)

map({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete into _" })

-- Enables Command+V to paste on neovide
-- See: https://github.com/neovide/neovide/issues/113
map({ "n", "v" }, "<D-v>", [["+p]])
map({ "i" }, "<D-v>", [[␒+]])

map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")
