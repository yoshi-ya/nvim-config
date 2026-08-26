return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
		{ "<leader><leader>", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
		{ "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Find buffers" },
		{ "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help tags" },
		{ "<leader>fd", "<cmd>Telescope diagnostics<CR>", desc = "Workspace diagnostics" },
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
	end,
}
