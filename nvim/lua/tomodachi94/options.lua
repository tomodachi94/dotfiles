vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")

-- enables per-filetype indentation settings
if vim.fn.has("autocmd") == 1 then
	vim.cmd("filetype indent plugin on")
end
