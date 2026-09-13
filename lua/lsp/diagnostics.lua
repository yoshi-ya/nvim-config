local M = {}

--- Global diagnostic presentation.
function M.setup()
	vim.diagnostic.config({
		virtual_text = true,
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = "█",
				[vim.diagnostic.severity.WARN] = "█",
				[vim.diagnostic.severity.INFO] = "i",
				[vim.diagnostic.severity.HINT] = "",
			},
		},
		underline = true,
		update_in_insert = false,
		severity_sort = true,
	})
end

return M
