local M = { "tpope/vim-endwise", event = { "InsertEnter" } }
local N = { "rstacruz/vim-closer", event = { "InsertEnter" } }
local O = {
	"dkarter/bullets.vim",
	ft = { "markdown", "text", "org", "mediawiki", "gitcommit" }
}

function O.config()
	vim.g.bullets_enabled_file_types = M.ft
end

local P = { "lukas-reineke/indent-blankline.nvim", event = { "InsertEnter" } }

return { M, N, O, P }
