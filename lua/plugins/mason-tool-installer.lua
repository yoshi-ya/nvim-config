return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = { "mason-org/mason.nvim" },

	config = function()
		require("mason-tool-installer").setup({
			ensure_installed = {
				-- LSPs are already being installed in lspconfig

				-- formatters (for conform)
				"black",
				"isort",
				"google-java-format",
				"stylua",

				-- linters (for nvim-lint)
				"ruff",
				"checkstyle",
				"eslint_d",
				"jsonlint",
				"yamllint"
			},

			auto_update = false,
			run_on_start = true,
		})
	end,
}
