local O = {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
	lazy = true,
	cmd = "Telescope",
	keys = { "<Leader>ff", "<Leader>fg", "<Leader>fr", "<Leader>fs" },
	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
		vim.keymap.set("n", "<leader>fr", builtin.lsp_references, {})
		vim.keymap.set("n", "<leader>fs", builtin.lsp_symbols, {})
	end,
}

function O.config()
	local builtin = require("telescope.builtin")
	vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
	vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
end

local P = { "liuchengxu/vim-which-key", lazy = true, cmd = "WhichKey" }

return { O, P }
