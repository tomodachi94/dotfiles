local M = {"williamboman/mason.nvim", config = true}
local N = {"williamboman/mason-lspconfig.nvim", config = true}

function M.config()
	require("mason").setup{
		ui = {
				icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗"
				}
			}
	}
end

return {M, N}
