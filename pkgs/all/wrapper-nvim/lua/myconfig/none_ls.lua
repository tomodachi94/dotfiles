local null_ls = require("null-ls")
local sources = null_ls.builtins

null_ls.setup {
	sources = {
		sources.formatting.treefmt.with {
			-- treefmt requires a config file
			condition = function(utils)
				return utils.root_has_file("treefmt.toml")
			end,
		},
	},
}
