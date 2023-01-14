local M = {
	"preservim/nerdtree",
	lazy = true,
	cmd = {
		"NERDTree",
		"NERDTreeVCS",
		"NERDTreeFromBookmark",
		"NERDTreeToggle",
		"NERDTreeToggleVCS",
		"NERDTreeFocus",
		"NERDTreeMirror",
		"NERDTreeClose",
		"NERDTreeFind",
		"NERDTreeCWD",
		"NERDTreeRefreshRoot",
	},
}

function M.config()
	vim.g.NERDTreeMinimalUI = 1
	vim.keymap.set("n", "<Leader>n", "<CR>:NERDTree<CR>")
end

return { M }
