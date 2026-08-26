return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = { "mason-org/mason.nvim" },
	opts = {
		-- LSP servers are installed by mason-lspconfig, see `lua/lsp/servers.lua`.
		ensure_installed = {
			-- formatters (for conform)
			"black",
			"isort",
			"google-java-format",
			"stylua",

			-- linters (for nvim-lint)
			"ruff",
			"eslint_d",
			"jsonlint",
			"yamllint",
		},
		auto_update = false,
		run_on_start = true,
	},
}
