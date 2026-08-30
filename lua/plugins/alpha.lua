return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = function()
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			"                                                     ",
			"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
			"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
			"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
			"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
			"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
			"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
			"                                                     ",
		}

		-- Shortcut labels mirror the `keys` specs of neotree.lua and telescope.lua.
		dashboard.section.buttons.val = {
			dashboard.button("e", "  New file", "<cmd>ene<CR>"),
			dashboard.button("SPC 1", "  Toggle file tree", "<cmd>Neotree toggle<CR>"),
			dashboard.button("SPC f f", "󰱼  Find files", "<cmd>Telescope find_files<CR>"),
			dashboard.button("SPC SPC", "  Live grep", "<cmd>Telescope live_grep<CR>"),
			dashboard.button("SPC f b", "  Find buffers", "<cmd>Telescope buffers<CR>"),
			dashboard.button("q", "  Quit", "<cmd>qa<CR>"),
		}

		return dashboard.opts
	end,
}
