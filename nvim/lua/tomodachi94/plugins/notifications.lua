local M = { "rcarriga/nvim-notify", enabled = false }

function M.init()
	require("notify").setup({})
	_G.vim.notify = require("notify")
end

return { M }
