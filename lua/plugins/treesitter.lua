return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"python",
				"java",
				"javadoc",
				"lua",
				"bash",
				"json",
				"yaml",
				"javascript",
				"typescript",
				"tsx",
				"regex",
				"dockerfile",
				"xml",
				"ini",
				"html",
				"gitignore",
				"angular",
			},
			highlight = { enable = true },
			indent = { enable = true },
			incremental_selection = { enable = true },
			textobjects = {
				select = { enable = true },
				move = { enable = true, set_jumps = true },
			},
		})
	end,
}
