local M = {}

--- Lazily-required Telescope picker, so the keymap does not load Telescope on attach.
---@param picker string
---@param opts table|nil
local function pick(picker, opts)
	return function()
		require("telescope.builtin")[picker](opts)
	end
end

--- Buffer-local LSP and diagnostic keymaps.
---@param buf integer
local function on_attach(buf)
	local map = function(modes, lhs, rhs, desc)
		vim.keymap.set(modes, lhs, rhs, { buffer = buf, desc = desc })
	end

	map("n", "K", vim.lsp.buf.hover, "Show documentation for what is under cursor")
	map("n", "gd", vim.lsp.buf.definition, "Show LSP definition")
	map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
	map("n", "gR", pick("lsp_references"), "Show LSP references")
	map("n", "gi", pick("lsp_implementations"), "Show LSP implementations")
	map("n", "gt", pick("lsp_type_definitions"), "Show LSP type definitions")

	map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "See available code actions")
	map("n", "<leader>co", function()
		vim.lsp.buf.code_action({
			context = { only = { "source.organizeImports" }, diagnostics = {} },
			apply = true,
			filter = function(action)
				return action.kind == "source.organizeImports"
			end,
		})
	end, "Organize imports")
	map("n", "<leader>rn", vim.lsp.buf.rename, "Smart rename")
	-- Nvim 0.12 ships `:lsp` with subcommands; nvim-lspconfig no longer defines `:LspRestart`.
	map("n", "<leader>rs", "<cmd>lsp restart<CR>", "Restart LSP")

	map("n", "<leader>D", pick("diagnostics", { bufnr = 0 }), "Show buffer diagnostics")
	map("n", "<leader>d", vim.diagnostic.open_float, "Show line diagnostics")
	map("n", "<leader>nd", function()
		vim.diagnostic.jump({ count = 1, float = true })
	end, "Go to next diagnostic")
	map("n", "<leader>Nd", function()
		vim.diagnostic.jump({ count = -1, float = true })
	end, "Go to previous diagnostic")
end

--- Apply the keymaps to every buffer an LSP client attaches to.
function M.setup()
	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("UserLspKeymaps", { clear = true }),
		callback = function(event)
			on_attach(event.buf)
		end,
	})
end

return M
