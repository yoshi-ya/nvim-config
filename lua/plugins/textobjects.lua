return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	config = function()
		-- ─── Treesitter: jump between functions ───────────────────────────────────────
		vim.keymap.set("n", "<leader>[", function()
			require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
		end, { desc = "Next function start" })
		vim.keymap.set("n", "<leader>]", function()
			require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
		end, { desc = "Prev function start" })

		-- ─── Treesitter: jump between classes ────────────────────────────────────────
		vim.keymap.set("n", "]c", function()
			require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
		end, { desc = "Next class start" })
		vim.keymap.set("n", "[c", function()
			require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
		end, { desc = "Prev class start" })
	end,
}
