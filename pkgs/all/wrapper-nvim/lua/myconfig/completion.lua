require("blink.cmp").setup {
	keymap = {
		preset = "super-tab",
		["<CR>"] = { "accept", "fallback" },
	},
	completion = {
		trigger = {
			show_on_keyword = true,
			show_in_snippet = false,
		},
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 200,
		},
		ghost_text = {
			enabled = true,
		},
	},
	signature = {
		enabled = true,
	},
}
