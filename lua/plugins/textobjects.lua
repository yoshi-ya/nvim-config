--- Jump to the next/previous Treesitter capture, e.g. `@function.outer`.
---@param direction string
---@param capture string
local function move(direction, capture)
	return function()
		require("nvim-treesitter-textobjects.move")[direction](capture, "textobjects")
	end
end

return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	-- `<leader>n<obj>` jumps forward, `<leader>N<obj>` backward.
	keys = {
		{ "<leader>nf", move("goto_next_start", "@function.outer"), desc = "Next function start" },
		{ "<leader>Nf", move("goto_previous_start", "@function.outer"), desc = "Prev function start" },
		{ "<leader>nc", move("goto_next_start", "@class.outer"), desc = "Next class start" },
		{ "<leader>Nc", move("goto_previous_start", "@class.outer"), desc = "Prev class start" },
	},
}
