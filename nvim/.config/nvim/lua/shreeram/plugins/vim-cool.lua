return {
    "romainl/vim-cool",
    commit = "9ea940c0d537e55de0de4c0298c04b976960fb12",
    config = function()
        vim.cmd([[set hlsearch]])
    end,
    keys = { "/", "?", "*", "#", "g*", "g#", "n", "N" },
}
