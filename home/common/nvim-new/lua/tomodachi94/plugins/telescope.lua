return function()
	local builtin = require("telescope.builtin")
	vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
	vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
	vim.keymap.set("n", "<leader>fr", builtin.lsp_references, {})
	vim.keymap.set("n", "<leader>fs", builtin.lsp_symbols, {})
end
