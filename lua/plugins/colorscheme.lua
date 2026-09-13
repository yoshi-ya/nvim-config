return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000, -- load before other plugins
	opts = {
		flavour = "mocha", -- latte, frappe, macchiato, mocha
		integrations = {
			telescope = true,
			neo_tree = true,
			cmp = true,
			treesitter = true,
			gitsigns = true,
		},
		custom_highlights = function(colors)
			return {
				GitSignsAdd = { fg = colors.blue },
				GitSignsChange = { fg = colors.blue },
				GitSignsStagedAdd = { fg = colors.green },
				GitSignsStagedChange = { fg = colors.green },
				NeoTreeGitModified = { fg = colors.peach },
				NeoTreeGitUntracked = { fg = colors.red },
			}
		end,
	},
	config = function(_, opts)
		require("catppuccin").setup(opts)
		vim.cmd.colorscheme("catppuccin")
	end,
}
