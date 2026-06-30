return {
	'stevearc/conform.nvim',
	event = { "BufReadPre", "BufNewFile" },

	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				json = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				markdown = { "prettier" },
				java = { "google-java-format" },
				xml = { "prettier" },
				yaml = { "prettier" },
			}
		})

		-- Keymap is defined centrally in config/keymaps.lua
	end,
}
