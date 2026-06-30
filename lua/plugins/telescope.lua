return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-telescope/telescope-ui-select.nvim",
		},

		config = function()
			local telescope = require("telescope")

			telescope.setup({
				defaults = {
					file_ignore_patterns = {
						".git/",
						"node_modules/",
						"target/", -- Java builds
						"__pycache__/", -- Python cache
						".venv/",
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})

			pcall(telescope.load_extension, "fzf")
			pcall(telescope.load_extension, "ui-select")

			-- Keymaps are defined centrally in config/keymaps.lua
		end,
	},
}
