return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzf-native.nvim",
		},

		build = "make", -- builds the fast search extension

		config = function()
			local telescope = require("telescope")

			telescope.setup({
				defaults = {
					file_ignore_patterns = {
						".git/",
						"node_modules/",
						"target/",       -- Java builds
						"__pycache__/",  -- Python cache
						".venv/",
					},
				},
			})

			pcall(telescope.load_extension, "fzf")

			local builtin = require("telescope.builtin")

			-- keymaps (JetBrains-like workflow)
			vim.keymap.set("n", "<C-p>", builtin.find_files)
			vim.keymap.set("n", "<leader>fg", builtin.live_grep)
		end,
	},
}
