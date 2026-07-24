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
					workspace = vim.fn.expand("~/.cache/jdtls/workspaces/")
						.. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t"),
				},
			})

			vim.lsp.config("*", {
				capabilities = require("blink.cmp").get_lsp_capabilities(),
			})

			-- ─── LSP (buffer-local, applied on LspAttach) ─────────────────────────────────
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspKeymaps", { clear = true }),
				callback = function(event)
					local map = function(modes, lhs, rhs, desc)
						vim.keymap.set(modes, lhs, rhs, { buffer = event.buf, desc = desc })
					end

					map("n", "K", vim.lsp.buf.hover, "LSP hover")
					map("n", "<leader>gd", vim.lsp.buf.definition, "Go to definition")
					map("n", "<leader>gD", vim.lsp.buf.declaration, "Go to declaration")
					map("n", "<leader>gr", function()
						require("telescope.builtin").lsp_references()
					end, "LSP references")
					map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
					map("n", "<leader>im", vim.lsp.buf.implementation, "Go to implementation")
					map("n", "<leader>cr", vim.lsp.buf.rename, "Rename symbol")
					map("n", "<leader>lf", vim.lsp.buf.format, "LSP format")
					map("n", "<leader>dn", function()
						vim.diagnostic.jump({ count = 1 })
					end, "Next diagnostic")
					map("n", "<leader>dp", function()
						vim.diagnostic.jump({ count = -1 })
					end, "Prev diagnostic")
					map("n", "<leader>de", vim.diagnostic.open_float, "Show diagnostic")
				end,
			})
		end,
	},
}
