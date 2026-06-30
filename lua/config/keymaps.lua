-- ─── Window & Buffer Navigation ───────────────────────────────────────────────
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>", { silent = true })
vim.keymap.set("n", "<S-Tab>", "<cmd>bprev<CR>", { silent = true })

-- ─── File Tree (NeoTree) ───────────────────────────────────────────────────────
vim.keymap.set("n", "<leader>1", "<cmd>Neotree toggle<CR>", { desc = "Toggle file tree" })
vim.keymap.set("n", "<leader>e", "<cmd>Neotree filesystem reveal left<CR>", { desc = "Reveal file in tree" })

-- ─── Telescope ────────────────────────────────────────────────────────────────
vim.keymap.set("n", "<leader>p", function() require("telescope.builtin").find_files() end, { desc = "Find files" })
vim.keymap.set("n", "<leader><leader>", function() require("telescope.builtin").live_grep() end, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", function() require("telescope.builtin").buffers() end, { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fh", function() require("telescope.builtin").help_tags() end, { desc = "Help tags" })

-- ─── Formatting (conform) ─────────────────────────────────────────────────────
vim.keymap.set({ "n", "v" }, "<leader>f", function()
	require("conform").format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	})
end, { desc = "Format file or selection" })

-- ─── Linting ──────────────────────────────────────────────────────────────────
vim.keymap.set("n", "<leader>l", function()
	require("lint").try_lint()
end, { desc = "Trigger linting for current file" })

-- ─── LSP (buffer-local, applied on LspAttach) ─────────────────────────────────
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspKeymaps", { clear = true }),
	callback = function(event)
		local map = function(modes, lhs, rhs, desc)
			vim.keymap.set(modes, lhs, rhs, { buffer = event.buf, desc = desc })
		end

		map("n", "K", vim.lsp.buf.hover, "LSP hover")
		map("n", "<leader>gd", vim.lsp.buf.definition, "Go to definition")
		map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
		map("n", "<leader>im", vim.lsp.buf.implementation, "Go to implementation")
		map("n", "<leader>r", vim.lsp.buf.rename, "Rename symbol")
		map("n", "<leader>lf", vim.lsp.buf.format, "LSP format")
		map("n", "<leader>dn", function() vim.diagnostic.jump({ count = 1 }) end, "Next diagnostic")
		map("n", "<leader>dp", function() vim.diagnostic.jump({ count = -1 }) end, "Prev diagnostic")
		map("n", "<leader>de", vim.diagnostic.open_float, "Show diagnostic")
	end,
})
