return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },

	config = function()
		require("gitsigns").setup({
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
		})

		vim.keymap.set("n", "<leader>hp", function()
			require("gitsigns").preview_hunk()
		end, { desc = "Preview hunk" })
		vim.keymap.set("n", "<leader>hs", function()
			require("gitsigns").stage_hunk()
		end, { desc = "Stage hunk" })
		vim.keymap.set("n", "<leader>hu", function()
			require("gitsigns").undo_stage_hunk()
		end, { desc = "Undo stage hunk" })
		vim.keymap.set("n", "<leader>hb", function()
			require("gitsigns").blame_line()
		end, { desc = "Blame line" })
	end,
}
