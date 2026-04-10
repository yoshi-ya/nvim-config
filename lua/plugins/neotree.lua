return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
		},

		keys = {
			{ "<leader>1", "<cmd>Neotree toggle<CR>", desc = "Toggle file tree" },
		},

		config = function()
			require("neo-tree").setup({
				close_if_last_window = true,
				filesystem = {
					follow_current_file = {
						enabled = true,
					},
				},
			})
			vim.keymap.set("n", "<leader>1", "<cmd>Neotree toggle<CR>")
			vim.keymap.set("n", "<leader>e", "<cmd>Neotree filesystem reveal left<CR>")
		end,
	},
}
