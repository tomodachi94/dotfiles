local M = { "aquach/vim-mediawiki-editor", lazy = true, cmd = { "MWRead", "MWWrite", "MWDiff", "MWBrowse" } }

local keyring = require("keyring")

--- MediaWiki plugin configuration ---
function M.config()
	vim.g.mediawiki_editor_url = "ftb.fandom.com"
	vim.g.mediawiki_editor_path = "/"
	vim.g.mediawiki_editor_uri_scheme = "https"
	vim.g.mediawiki_editor_username = "Tomodachi94@nvim"
	vim.g.mediawiki_editor_password = keyring.get(vim.g.mediawiki_editor_url, vim.g.mediawiki_editor_username)
end

return { M }
