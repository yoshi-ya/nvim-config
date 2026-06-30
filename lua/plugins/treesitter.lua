return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	config = function()
		local ok, ts_configs = pcall(require, "nvim-treesitter.configs")
		if not ok then
			return
		end

		ts_configs.setup({
			ensure_installed = { "python", "java", "javadoc", "lua", "bash", "json", "yaml", "javascript", "typescript", "tsx", "regex", "dockerfile", "xml", "ini", "html", "gitignore", "angular" },
			highlight = { enable = true },
			indent = { enable = true },
			incremental_selection = { enable = true },
			rainbow = { enable = true },
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = { query = "@function.outer", desc = "Select outer function" },
						["if"] = { query = "@function.inner", desc = "Select inner function" },
						["ac"] = { query = "@class.outer", desc = "Select outer class" },
						["ic"] = { query = "@class.inner", desc = "Select inner class" },
						["aa"] = { query = "@parameter.outer", desc = "Select outer argument" },
						["ia"] = { query = "@parameter.inner", desc = "Select inner argument" },
					},
				},
				move = {
					enable = true,
					set_jumps = true,
					goto_next_start = {
						["]m"] = { query = "@function.outer", desc = "Next function start" },
						["]c"] = { query = "@class.outer", desc = "Next class start" },
					},
					goto_next_end = {
						["]M"] = { query = "@function.outer", desc = "Next function end" },
						["]C"] = { query = "@class.outer", desc = "Next class end" },
					},
					goto_previous_start = {
						["[m"] = { query = "@function.outer", desc = "Prev function start" },
						["[c"] = { query = "@class.outer", desc = "Prev class start" },
					},
					goto_previous_end = {
						["[M"] = { query = "@function.outer", desc = "Prev function end" },
						["[C"] = { query = "@class.outer", desc = "Prev class end" },
					},
				},
			},
		})
	end
}
