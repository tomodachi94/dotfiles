local M = {"williamboman/mason.nvim", config = true}

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

-- Disabled for now
return {M}
