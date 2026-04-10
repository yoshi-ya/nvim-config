return {
	{
		"mason-org/mason.nvim",
		opts = {}
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"lua_ls",
				"pyright",
				"ts_ls",
				"angularls",
				"jsonls",
				"jdtls",
				"dockerls",
				"docker_compose_language_service",
			}
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.lsp.enable({ "lua_ls", "pyright", "ts_ls", "angularls", "jsonls", "jdtls", "dockerls", "docker_compose_language_service" })

			vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set({"n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end
	}
}
