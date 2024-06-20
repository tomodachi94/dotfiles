return function()
	vim.g.NERDTreeMinimalUI = 1
	vim.keymap.set("n", "<Leader>n", "<CR>:NERDTree<CR>")
end
