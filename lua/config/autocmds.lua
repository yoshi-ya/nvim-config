-- Global autocmds. Plugin-specific autocmds live in that plugin's spec.

-- Start Treesitter highlighting for any filetype with a parser installed.
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("UserTreesitter", { clear = true }),
	callback = function(event)
		pcall(vim.treesitter.start, event.buf)
	end,
})
