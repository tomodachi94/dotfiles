vim.lsp.config(
	"yamlls",
	require("myconfig.lsputils")({
		schemas = {
			["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
			["https://json.schemastore.org/dependabot-v2.json"] = "/.github/dependabot.*",
		},
	})
)
vim.lsp.enable("yamlls")
