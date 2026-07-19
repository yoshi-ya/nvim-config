return {
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

		vim.keymap.set("n", "<leader>p", function()
			require("telescope.builtin").find_files()
		end, { desc = "Find files" })
		vim.keymap.set("n", "<leader><leader>", function()
			require("telescope.builtin").live_grep()
		end, { desc = "Live grep" })
		vim.keymap.set("n", "<leader>fb", function()
			require("telescope.builtin").buffers()
		end, { desc = "Find buffers" })
		vim.keymap.set("n", "<leader>fh", function()
			require("telescope.builtin").help_tags()
		end, { desc = "Help tags" })
		vim.keymap.set("n", "<leader>ds", function()
			require("telescope.builtin").diagnostics()
		end, { desc = "Workspace diagnostics" })
	end,
}
