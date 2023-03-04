local M = { "neovim/nvim-lspconfig" }

function M.config()
	local lspconfig = require("lspconfig")
	local lsp_defaults = lspconfig.util.default_config

	lsp_defaults.capabilities =
		vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

	local capabilities = require("cmp_nvim_lsp").default_capabilities()
	require("lspconfig")["lua_ls"].setup {
		capabilities = capabilities,
		settings = {
			workspace = {
				userThirdParty = {"~/.local/share/lua-language-server/libraries"},
			}
		}
	}
	require("lspconfig")["rust_analyzer"].setup {
		capabilities = capabilities,
	}
	require("lspconfig")["rnix"].setup {
		capabilities = capabilities,
	}

local N = { "jose-elias-alvarez/null-ls.nvim", dependencies = { "nvim-lua/plenary.nvim" } }

function N.config()
	local null_ls = require("null-ls")
	local sources = null_ls.builtins

	sources.code_actions.shellcheck.filetypes = { "sh", "bash", "zsh" }

	null_ls.setup {
		sources = {
			sources.formatting.stylua,
			sources.diagnostics.selene,
			sources.code_actions.proselint,
			sources.code_actions.shellcheck,
			sources.completion.spell,
			sources.diagnostics.ruff,
			sources.diagnostics.mypy,
		}
	}
end

return { M }
