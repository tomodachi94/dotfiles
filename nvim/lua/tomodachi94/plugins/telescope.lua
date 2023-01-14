return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
	lazy = true,
	cmd = "Telescope",
	keys = {"<Leader>ff", "<Leader>fg"},
	config = function()
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
	end
}
