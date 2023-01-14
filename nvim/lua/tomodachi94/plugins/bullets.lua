local M = {
		"dkarter/bullets.vim",
		ft = { "markdown", "text", "org", "mediawiki", "gitcommit" }
		}

function M.config()
	vim.g.bullets_enabled_file_types = M.ft
end

return { M }
