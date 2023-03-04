local M = { "catppuccin/nvim", name = "catppuccin" }

function M.config()
	require("catppuccin").setup({
		flavour = "mocha",
	})
end

return M
