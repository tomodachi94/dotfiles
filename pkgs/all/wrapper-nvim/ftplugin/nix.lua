local null_ls = require("null-ls")
vim.lsp.config("nil_ls", require("myconfig.lsputils")({}))
vim.lsp.enable("nil_ls")

null_ls.register(null_ls.builtins.diagnostics.statix)
null_ls.register(null_ls.builtins.diagnostics.deadnix)
