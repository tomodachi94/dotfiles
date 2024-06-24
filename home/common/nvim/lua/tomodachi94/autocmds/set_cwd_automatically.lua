vim.api.nvim_create_autocmd("BufEnter", {
	callback = function(event_args)
		local root = vim.fs.root(event_args.buf, { ".git", ".hg", "_FOSSIL", ".svn" })
		if root then
			vim.uv.chdir(root)
		end
	end,
})
