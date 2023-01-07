local M = { "rcarriga/nvim-notify" }

function M.config()
	_G.vim.notify = require("notify")
end

return {M}
