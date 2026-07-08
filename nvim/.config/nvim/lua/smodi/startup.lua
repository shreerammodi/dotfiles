-- Disable default plugins to improve performance
for _, name in ipairs({
	"getscript",
	"getscriptPlugin",
	"gzip",
	"logipat",
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"matchit",
	"tar",
	"tarPlugin",
	"rrhelper",
	"spellfile_plugin",
	"vimball",
	"vimballPlugin",
	"zip",
	"zipPlugin",
	"tutor",
	"rplugin",
	"syntax",
	"synmenu",
	"optwin",
	"compiler",
	"bugreport",
	"ftplugin",
}) do
	vim.g["loaded_" .. name] = 1
end

---@param repo string
---@return string
_G.gh = function(repo)
	return "https://github.com/" .. repo
end

_G.add = vim.pack.add

_G.map = vim.keymap.set

vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.filetype.add({
    extension = {
        gs = "javascript"
    }
})
