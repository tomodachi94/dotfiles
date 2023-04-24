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

--Hide the 'How to disable mouse' prompt in the right-click dialog
vim.cmd("aunmenu PopUp.How-to\\ disable\\ mouse")
vim.cmd("aunmenu PopUp.-1-")

vim.g.python3_host_prog = "/usr/bin/python3"

--Enable per-filetype indentation settings
if vim.fn.has("autocmd") == 1 then
	vim.cmd("filetype indent plugin on")
end
