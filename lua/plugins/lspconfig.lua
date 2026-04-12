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
			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				underline = true,
				update_in_insert = true,
				severity_sort = true,
			})

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local servers = {
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

			for _, server in ipairs(servers) do
				vim.lsp.config(server, {
					capabilities = capabilities,
				})
				vim.lsp.enable(server)
			end

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>im", vim.lsp.buf.implementation, {})
			vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {})
			vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, {})
			vim.keymap.set("n", "<leader>dn", function() vim.diagnostic.jump({ count = 1 }) end, { desc = "Next diagnostic" })
			vim.keymap.set("n", "<leader>dp", function() vim.diagnostic.jump({ count = -1 }) end, { desc = "Prev diagnostic" })
			vim.keymap.set("n", "<leader>de", vim.diagnostic.open_float, { desc = "Show diagnostic" })
		end
	}
}
