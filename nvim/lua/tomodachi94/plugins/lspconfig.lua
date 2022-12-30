local M = { "neovim/nvim-lspconfig" }

function M.config()
	local lspconfig = require("lspconfig")
	local lsp_defaults = lspconfig.util.default_config

	lsp_defaults.capabilities =
		vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())
	
	local capabilities = require("cmp_nvim_lsp").default_capabilities()
	require("lspconfig")["sumneko_lua"].setup {
		capabilities = capabilities,
	}
end

return { M }
