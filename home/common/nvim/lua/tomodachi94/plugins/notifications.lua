local vars = require("generated_vars")
local M = { "Ajnasz/notify-send.nvim" }

function M.init()
	require("notify-send").setup {
		command = vars.notify_send,
	}
end

return { M }
