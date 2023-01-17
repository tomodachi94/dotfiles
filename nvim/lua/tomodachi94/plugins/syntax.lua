--- Primary file for all syntax highlighting
-- Plugins whose primary function is to do something else should go into a new file
-- Otherwise, this is the place.

-- local M = { "sheerun/vim-polyglot" }

local M = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate"
}

local N = { "chikamichi/mediawiki.vim", ft = { "mediawiki" } }

return { M, N }
