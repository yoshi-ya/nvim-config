return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = "Trouble",

	keys = {
		{ "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", desc = "Workspace diagnostics (Trouble)" },
		{ "<leader>xb", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Buffer diagnostics (Trouble)" },
		{ "<leader>xs", "<cmd>Trouble symbols toggle focus=false<CR>", desc = "Symbols (Trouble)" },
		{ "<leader>xl", "<cmd>Trouble lsp toggle focus=false win.position=right<CR>", desc = "LSP definitions/refs (Trouble)" },
		{ "<leader>xq", "<cmd>Trouble qflist toggle<CR>", desc = "Quickfix list (Trouble)" },
	},

	opts = {},
}
