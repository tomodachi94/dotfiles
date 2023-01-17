local M = {
	"tpope/vim-fugitive",
	lazy = true,
	cmd = {
		"Gedit",
		"Gdiffsplit",
		"Gread",
		"Gwrite",
		"Ggrep",
		"Glgrep",
		"GMove",
		"GRename",
		"GDelete",
		"GBrowse",
		"G",
		"Git"
	},
	config = false,
}

local N = {
	"preservim/nerdtree",
	lazy = true,
	cmd = {
		"NERDTree",
		"NERDTreeVCS",
		"NERDTreeFromBookmark",
		"NERDTreeToggle",
		"NERDTreeToggleVCS",
		"NERDTreeFocus",
		"NERDTreeMirror",
		"NERDTreeClose",
		"NERDTreeFind",
		"NERDTreeCWD",
		"NERDTreeRefreshRoot",
	},
}

function N.config()
	vim.g.NERDTreeMinimalUI = 1
	vim.keymap.set("n", "<Leader>n", "<CR>:NERDTree<CR>")
end

local O = {
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

function O.config()
	local builtin = require('telescope.builtin')
	vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
	vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
end

local P = { "liuchengxu/vim-which-key", lazy = true, cmd = "WhichKey" }

return { M, N, O, P }
