return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	cmd = "Neotree",
	keys = {
		{ "<leader>1", "<cmd>Neotree toggle<CR>", desc = "Toggle file tree" },
		{ "<leader>e", "<cmd>Neotree filesystem reveal left<CR>", desc = "Reveal file in tree" },
	},
	opts = {
		close_if_last_window = true,
		enable_diagnostics = false,
		filesystem = {
			follow_current_file = {
				enabled = true,
			},
			filtered_items = {
				visible = true,
				hide_dotfiles = false,
				hide_gitignored = false,
			},
			components = {
				-- No icon; git state is conveyed by coloring the filename instead
				-- (via `name`'s `use_git_status_colors`, on by default).
				git_status = function(_, node, state)
					local git = require("neo-tree.git")
					local status = git.find_existing_status_code(node.path, state.git_base_by_worktree)
					if not status then
						return {}
					end
					if type(status) == "table" then
						status = status[1]
					end
					if status == "?" then
						return { text = "", highlight = "NeoTreeGitUntracked" }
					end
					if status == "!" then
						return { text = "", highlight = "NeoTreeGitIgnored" }
					end
					local x, y = status:sub(1, 1), status:sub(2, 2)
					if x ~= "." then
						return { text = "", highlight = "NeoTreeGitAdded" }
					end
					if y ~= "." then
						return { text = "", highlight = "NeoTreeGitModified" }
					end
					return {}
				end,
			},
		},
	},
}
