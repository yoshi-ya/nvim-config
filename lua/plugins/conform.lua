return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({
					lsp_fallback = true,
					async = false,
					-- jdtls is slow to answer a format request on a cold project.
					timeout_ms = vim.bo.filetype == "java" and 3000 or 500,
				})
			end,
			mode = { "n", "v" },
			desc = "Format file or selection",
		},
	},
	opts = {
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
	},
}
