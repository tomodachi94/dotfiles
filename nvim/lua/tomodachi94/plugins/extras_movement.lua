local M = { "ggandor/leap.nvim", keys = { "s", "S" } }

function M.config()
	require("leap").add_default_mappings()
end

return M
