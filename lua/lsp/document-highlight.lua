local M = {}

local group = vim.api.nvim_create_augroup("UserLspDocumentHighlight", { clear = true })

--- Highlight every occurrence of the symbol under the cursor, and clear it on move.
---@param buf integer
local function enable(buf)
	-- Re-created from scratch so a second capable client does not duplicate the autocmds.
	vim.api.nvim_clear_autocmds({ group = group, buffer = buf })

	vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
		group = group,
		buffer = buf,
		callback = vim.lsp.buf.document_highlight,
	})

	vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
		group = group,
		buffer = buf,
		callback = vim.lsp.buf.clear_references,
	})
end

--- Enable document highlighting for every buffer a capable LSP client attaches to.
function M.setup()
	vim.api.nvim_create_autocmd("LspAttach", {
		group = group,
		callback = function(event)
			local client = vim.lsp.get_client_by_id(event.data.client_id)
			if client and client:supports_method("textDocument/documentHighlight", event.buf) then
				enable(event.buf)
			end
		end,
	})

	vim.api.nvim_create_autocmd("LspDetach", {
		group = group,
		callback = function(event)
			vim.lsp.buf.clear_references()
			-- `LspDetach` fires before the client is removed, so ignore the one detaching.
			local remaining = vim.tbl_filter(function(client)
				return client.id ~= event.data.client_id
					and client:supports_method("textDocument/documentHighlight", event.buf)
			end, vim.lsp.get_clients({ bufnr = event.buf }))

			if #remaining == 0 then
				vim.api.nvim_clear_autocmds({ group = group, buffer = event.buf })
			end
		end,
	})
end

return M
