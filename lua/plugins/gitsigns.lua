return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{ "<leader>hp", "<cmd>Gitsigns preview_hunk<CR>", desc = "Preview hunk" },
		{ "<leader>hi", "<cmd>Gitsigns preview_hunk_inline<CR>", desc = "Preview hunk inline" },
		{ "<leader>hs", "<cmd>Gitsigns stage_hunk<CR>", desc = "Stage hunk" },
		{ "<leader>hb", "<cmd>Gitsigns blame_line<CR>", desc = "Blame line" },
		{ "<leader>hr", "<cmd>Gitsigns reset_hunk<CR>", desc = "Reset hunk" },
		{ "<leader>hr", ":Gitsigns reset_hunk<CR>", mode = "v", desc = "Reset selected hunks" },
		{ "<leader>hR", "<cmd>Gitsigns reset_buffer<CR>", desc = "Reset buffer" },
		{ "<leader>hn", "<cmd>Gitsigns nav_hunk next<CR>", desc = "Navigate to next hunk" },
		{ "<leader>hN", "<cmd>Gitsigns nav_hunk prev<CR>", desc = "Navigate to previous hunk" },
	},
	opts = {
		signs = {
			add = { text = "│" },
			change = { text = "│" },
			delete = { text = "▸" },
			topdelete = { text = "▸" },
			changedelete = { text = "│" },
			untracked = { text = "┆" },
		},
		signs_staged = {
			add = { text = "│" },
			change = { text = "│" },
			delete = { text = "▸" },
			topdelete = { text = "▸" },
			changedelete = { text = "│" },
		},
		current_line_blame = false,
	},
}
