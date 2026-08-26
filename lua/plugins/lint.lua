return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{
			"<leader>cl",
			function()
				require("lint").try_lint()
			end,
			desc = "Trigger linting for current file",
		},
	},
	config = function()
		-- nvim-lint has no `setup()`; configuration is plain field assignment.
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			python = { "ruff" },
			json = { "jsonlint" },
			yaml = { "yamllint" },
		}

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = vim.api.nvim_create_augroup("UserLint", { clear = true }),
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
