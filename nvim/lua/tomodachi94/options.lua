vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.termguicolors = true

vim.cmd("xnoremap j gj")
vim.cmd("xnoremap k gk")
vim.cmd("xnoremap <Down> gj")
vim.cmd("xnoremap <Up> gk")

-- enables per-filetype indentation settings
if vim.fn.has("autocmd") == 1 then
	vim.cmd("filetype indent plugin on")
end
