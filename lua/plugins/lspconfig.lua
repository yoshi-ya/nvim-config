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
				"html",
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
			vim.lsp.enable({ "lua_ls", "pyright", "ts_ls", "angularls", "jsonls", "jdtls", "dockerls", "docker_compose_language_service", "html" })

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set({"n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>im", vim.lsp.buf.implementation, {})
			vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {})
			vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, {})
		end
	}
}
