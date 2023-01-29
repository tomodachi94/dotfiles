local M = { "tpope/vim-endwise", event = { "BufEnter" } }
local N = { "rstacruz/vim-closer", event = { "BufEnter" } }
local O = {
	"dkarter/bullets.vim",
	ft = { "markdown", "text", "org", "mediawiki", "gitcommit" }
}

function O.config()
	vim.g.bullets_enabled_file_types = M.ft
end
return { M, N, O }