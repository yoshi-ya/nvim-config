return {
	"stevearc/conform.nvim",
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
				xml = { "prettier" },
				yaml = { "prettier" },
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>cf", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = vim.bo.filetype == "java" and 3000 or 500,
			})
		end, { desc = "Format file or selection" })
	end,
}
