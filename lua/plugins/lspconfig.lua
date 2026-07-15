return {
	{ "mason-org/mason.nvim", opts = {} },
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
				"lemminx",
				"yamlls",
			},
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
			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
			})

			vim.lsp.config("jdtls", {
			settings = {
				java = {
					configuration = {
						runtimes = {
							{
								name = "JavaSE-25",
								path = "/opt/homebrew/Cellar/openjdk@25/25.0.3/libexec/openjdk.jdk/Contents/Home",
								default = true,
							},
						},
					},
				},
			},
			init_options = {
				workspace = vim.fn.expand("~/.cache/jdtls/workspaces/") .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t"),
			},
		})

		vim.lsp.config("*", {
				capabilities = require("blink.cmp").get_lsp_capabilities(),
			})
		end,
	},
}
