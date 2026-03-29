return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000, -- load before other plugins
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				integrations = {
					telescope = true,
					neo_tree = true,
					cmp = true,
					treesitter = true,
				},
			})

			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
