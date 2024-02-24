local M = { "hrsh7th/nvim-cmp", lazy = true }
local N = { "hrsh7th/cmp-buffer", dependencies = "hrsh7th/nvim-cmp", event = { "InsertEnter" } }
local O = { "hrsh7th/cmp-path", dependencies = "hrsh7th/nvim-cmp", event = { "InsertEnter" } }
local P =
	{ "hrsh7th/cmp-nvim-lsp", dependencies = "hrsh7th/nvim-cmp", "neovim/nvim-lspconfig", event = { "InsertEnter" } }
local Q =
	{ "saadparwaiz1/cmp_luasnip", dependencies = "hrsh7th/nvim-cmp", "L3MON4D3/LuaSnip", event = { "InsertEnter" } }
local R = { "onsails/lspkind.nvim", lazy = true, event = { "InsertEnter" } }

function M.config()
	-- Set up nvim-cmp.
	local cmp = require("cmp")
	local lspkind = require("lspkind")

	vim.opt.completeopt = { "menu", "menuone", "noselect" }

	cmp.setup {
		snippet = {
			-- REQUIRED - you must specify a snippet engine
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		window = {
			-- completion = cmp.config.window.bordered(),
			-- documentation = cmp.config.window.bordered(),
		},
		mapping = cmp.mapping.preset.insert {
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.abort(),
			["<CR>"] = cmp.mapping.confirm { select = true }, -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		},
		formatting = {
			format = lspkind.cmp_format(),
		},
		sources = cmp.config.sources {
			{ name = "nvim_lsp" },
			{ name = "luasnip" }, -- For luasnip users.
			{ name = "buffer" },
		},
	}
	-- Set configuration for specific filetype.
	cmp.setup.filetype("lua", {
		sources = cmp.config.sources {
			{ name = "nvim_lsp" },
			{ name = "ultisnips" },
		},
	})

	-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline({ "/", "?" }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	})

	-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{ name = "cmdline" },
		}),
	})

	-- Set up lspconfig.
	local capabilities = require("cmp_nvim_lsp").default_capabilities()
	require("lspconfig")["lua_ls"].setup {
		capabilities = capabilities,
	}
end
return { M, N, O, P, Q, R }
