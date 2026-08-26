return {
	{ "mason-org/mason.nvim", opts = {} },
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = require("lsp.servers"),
			handlers = {
				function(server_name)
					vim.lsp.enable(server_name)
				end,
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("lsp.diagnostics").setup()
			require("lsp.keymaps").setup()
			require("lsp.document-highlight").setup()

			vim.lsp.config("*", {
				capabilities = require("blink.cmp").get_lsp_capabilities(),
			})
		end,
	},
}
