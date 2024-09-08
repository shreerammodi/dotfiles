return {
	"PaterJason/cmp-conjure",
	commit = "8c9a88efedc0e5bf3165baa6af8a407afe29daf6",
	lazy = true,
	config = function()
		local cmp = require("cmp")
		local config = cmp.get_config()
		table.insert(config.sources, { name = "conjure" })
		return cmp.setup(config)
	end,
}
