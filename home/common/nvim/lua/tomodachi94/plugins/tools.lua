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
		"Git",
	},
	config = false,
	dependencies = { "tpope/vim-rhubarb" },
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
	require("tomodachi94.util").uniqueKeymap("n", "<Leader>n", "<CR>:NERDTree<CR>")
end

local O = {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
	lazy = true,
	cmd = "Telescope",
	keys = { "<Leader>ff", "<Leader>fg", "<Leader>fr", "<Leader>fs" },
	config = function()
		local builtin = require("telescope.builtin")
		require("tomodachi94.util").uniqueKeymap("n", "<leader>ff", builtin.find_files, {})
		require("tomodachi94.util").uniqueKeymap("n", "<leader>fg", builtin.live_grep, {})
		require("tomodachi94.util").uniqueKeymap("n", "<leader>fr", builtin.lsp_references, {})
		require("tomodachi94.util").uniqueKeymap("n", "<leader>fs", builtin.lsp_symbols, {})
	end,
}

function O.config()
	local builtin = require("telescope.builtin")
	require("tomodachi94.util").uniqueKeymap("n", "<leader>ff", builtin.find_files, {})
	require("tomodachi94.util").uniqueKeymap("n", "<leader>fg", builtin.live_grep, {})
end

local P = { "liuchengxu/vim-which-key", lazy = true, cmd = "WhichKey" }

local Q = {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "https://github.com/folke/lsp-colors.nvim" },
	cmd = { "Trouble", "TroubleClose", "TroubleToggle", "TroubleRefresh" },
}

function Q.config()
	require("trouble").setup {}
end

return { M, N, O, P, Q }
