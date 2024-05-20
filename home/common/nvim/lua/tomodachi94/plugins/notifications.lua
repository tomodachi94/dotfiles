local M = { "rcarriga/nvim-notify" }

function M.init()
	-- selene: allow(global_usage)
	-- no other way to do this unfortunately
	_G.vim.notify = require("notify")
end

return { M }
