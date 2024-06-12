local M = { "neovim/nvim-lspconfig", event = { "InsertEnter" } }

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
				userThirdParty = { "~/.local/share/lua-language-server/libraries" },
			},
		},
	}
	require("lspconfig")["rust_analyzer"].setup {
		capabilities = capabilities,
	}
	require("lspconfig")["nil_ls"].setup {
		capabilities = capabilities,
	}

	require("lspconfig")["ruff_lsp"].setup {
		capabilities = capabilities,
	}

	require("lspconfig")["lexical"].setup {
		capabilities = capabilities,
		cmd = { "/etc/profiles/per-user/me/bin/lexical" },
	}
end

local N = { "nvimtools/none-ls.nvim", dependencies = { "nvim-lua/plenary.nvim" }, event = { "InsertEnter" } }

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
			sources.formatting.treefmt.with {
				-- treefmt requires a config file
				condition = function(utils)
					return utils.root_has_file("treefmt.toml")
				end,
			},
		},
	}
end

return { M, N }
