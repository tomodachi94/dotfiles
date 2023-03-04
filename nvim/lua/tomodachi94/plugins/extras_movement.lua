local M = { "ggandor/leap.nvim" }

function M.config()
	require('leap').add_default_mappings()
end

return M
