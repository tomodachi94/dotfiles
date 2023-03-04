---Setup vanilla Vim options
--Plugin options should go into their respective plugin spec files

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.termguicolors = true

--Hide the welcome menu
vim.opt.shortmess = ""

--Enable relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

vim.cmd("xnoremap j gj")
vim.cmd("xnoremap k gk")
vim.cmd("xnoremap <Down> gj")
vim.cmd("xnoremap <Up> gk")
--Hide the 'How to disable mouse' prompt in the right-click dialog

--Enable per-filetype indentation settings
if vim.fn.has("autocmd") == 1 then
	vim.cmd("filetype indent plugin on")
end
