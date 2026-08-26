return {
	"christoomey/vim-tmux-navigator",
	cmd = {
		"TmuxNavigateLeft",
		"TmuxNavigateDown",
		"TmuxNavigateUp",
		"TmuxNavigateRight",
		"TmuxNavigatePrevious",
		"TmuxNavigatorProcessList",
	},
	keys = {
		{ "<C-h>", "<cmd><C-U>TmuxNavigateLeft<CR>", desc = "Go to left window or tmux pane" },
		{ "<C-j>", "<cmd><C-U>TmuxNavigateDown<CR>", desc = "Go to lower window or tmux pane" },
		{ "<C-k>", "<cmd><C-U>TmuxNavigateUp<CR>", desc = "Go to upper window or tmux pane" },
		{ "<C-l>", "<cmd><C-U>TmuxNavigateRight<CR>", desc = "Go to right window or tmux pane" },
		{ "<C-\\>", "<cmd><C-U>TmuxNavigatePrevious<CR>", desc = "Go to previous window or tmux pane" },
	},
}
