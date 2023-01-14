local M = { "rcarriga/nvim-notify" }

function M.init()
	_G.vim.notify = require("notify")
end

return {M}
