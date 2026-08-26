return {
	"vim-test/vim-test",
	dependencies = {
		"preservim/vimux",
	},
	keys = {
		{ "<leader>tn", "<cmd>TestNearest<CR>", desc = "Test nearest" },
		{ "<leader>tf", "<cmd>TestFile<CR>", desc = "Test file" },
		{ "<leader>ta", "<cmd>TestSuite<CR>", desc = "Test suite (all)" },
		{ "<leader>tl", "<cmd>TestLast<CR>", desc = "Test last" },
		{ "<leader>tv", "<cmd>TestVisit<CR>", desc = "Test visit" },
	},
	init = function()
		-- Run tests in a tmux pane via vimux.
		vim.g["test#strategy"] = "vimux"
	end,
}
