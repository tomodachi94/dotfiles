local M = { "williamboman/mason.nvim", enabled = false }
local N = { "williamboman/mason-lspconfig.nvim", enabled = false, config = true }
local O = { "WhoIsSethDaniel/mason-tool-installer.nvim", enabled = false }

function M.config()
	require("mason").setup {
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	}
end

function N.config()
	require("mason-tool-installer").setup {
		ensure_installed = {
			"stylua",
			"selene",
			"proselint",
			"shellcheck",
			"ruff",
			"mypy",
		},
	}
end

return { M, N, O }
