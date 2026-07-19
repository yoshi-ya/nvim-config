return {
	"saghen/blink.cmp",
	version = "*",
	opts = {
		keymap = {
			preset = "default",
			["<Tab>"] = { "accept", "fallback" },
			["<CR>"] = { "accept", "fallback" },
		},
		appearance = { nerd_font_variant = "mono" },
		sources = { default = { "lsp", "path", "snippets", "buffer" } },
	},
}
