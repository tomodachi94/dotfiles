-- UltiSnips configuration

local M = { "SirVer/UltiSnips" }

function M.config()
	vim.g.UltiSnipsSnippetDirectories = { "UltiSnips", "snips" }
	vim.g.UltiSnipsExpandTrigger = "<tab>"
	vim.g.UltiSnipsJumpForwardTrigger = "<tab>"
	vim.g.UltiSnipsJumpBackwardTrigger = "<s-tab>"
end

return { M }
