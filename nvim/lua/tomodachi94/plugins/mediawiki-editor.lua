local M = {"aquach/vim-mediawiki-editor", lazy = true, cmd = {"MWRead", "MWWrite", "MWDiff", "MWBrowse"}}

--- MediaWiki plugin configuration ---
function M.config()
	vim.g.mediawiki_editor_url = "ftb.fandom.com"
	vim.g.mediawiki_editor_path = "/"
	vim.g.mediawiki_editor_uri_scheme = "https"
end

return {M}
