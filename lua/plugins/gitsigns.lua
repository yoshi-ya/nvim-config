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
		vim.keymap.set("n", "<leader>hi", function()
			require("gitsigns").preview_hunk_inline()
		end, { desc = "Preview hunk" })
		vim.keymap.set("n", "<leader>hs", function()
			require("gitsigns").stage_hunk()
		end, { desc = "Stage hunk" })
		vim.keymap.set("n", "<leader>hb", function()
			require("gitsigns").blame_line()
		end, { desc = "Blame line" })
		vim.keymap.set("n", "<leader>hr", function()
			require("gitsigns").reset_hunk()
		end, { desc = "Reset hunk" })
		vim.keymap.set("v", "<leader>hr", function()
			require("gitsigns").reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end, { desc = "Reset selected hunks" })
		vim.keymap.set("n", "<leader>hR", function()
			require("gitsigns").reset_buffer()
		end, { desc = "Reset buffer" })
	end,
}
