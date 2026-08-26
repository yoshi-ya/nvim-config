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
		},
	},
	config = function(_, opts)
		require("catppuccin").setup(opts)
		vim.cmd.colorscheme("catppuccin")
	end,
}
