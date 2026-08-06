return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	config = function()
		local move = function(direction, capture)
			return function()
				require("nvim-treesitter-textobjects.move")[direction](capture, "textobjects")
			end
		end

		-- ─── Treesitter: jump between functions and classes ───────────────────────────
		-- `<leader>n<obj>` jumps forward, `<leader>N<obj>` backward.
		local map = function(lhs, rhs, desc)
			vim.keymap.set("n", lhs, rhs, { desc = desc })
		end

		map("<leader>nf", move("goto_next_start", "@function.outer"), "Next function start")
		map("<leader>Nf", move("goto_previous_start", "@function.outer"), "Prev function start")
		map("<leader>nc", move("goto_next_start", "@class.outer"), "Next class start")
		map("<leader>Nc", move("goto_previous_start", "@class.outer"), "Prev class start")
	end,
}
