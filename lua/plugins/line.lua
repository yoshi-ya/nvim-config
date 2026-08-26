return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"catppuccin/nvim",
	},
	opts = {
		options = {
			theme = "catppuccin-mocha",
		},
		sections = {
			lualine_b = {
				"branch",
				{
					"diff",
					source = function()
						local gitsigns = vim.b.gitsigns_status_dict
						if gitsigns then
							return {
								added = gitsigns.added,
								modified = gitsigns.changed,
								removed = gitsigns.removed,
							}
						end
					end,
				},
			},
			lualine_x = {
				{
					"diagnostics",
					sources = { "nvim_diagnostic" },
					sections = { "error", "warn", "info", "hint" },
					symbols = { error = "✗ ", warn = "⚠ ", info = "ℹ ", hint = "➔ " },
					colored = true,
					always_visible = false,
				},
				"encoding",
				"fileformat",
				"filetype",
			},
		},
	},
}
