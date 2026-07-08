-- ─── Treesitter: jump between functions ───────────────────────────────────────
vim.keymap.set("n", "<C-j>", function()
	require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
end, { desc = "Next function start" })
vim.keymap.set("n", "<C-k>", function()
	require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
end, { desc = "Prev function start" })

-- ─── Treesitter: jump between classes ────────────────────────────────────────
vim.keymap.set("n", "]c", function()
	require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
end, { desc = "Next class start" })
vim.keymap.set("n", "[c", function()
	require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
end, { desc = "Prev class start" })

-- ─── Buffer Navigation ───────────────────────────────────────────────
vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>", { silent = true })
vim.keymap.set("n", "<S-Tab>", "<cmd>bprev<CR>", { silent = true })

-- ─── File Tree (NeoTree) ── keymaps live in neotree.lua keys={} for lazy-loading

-- ─── Telescope ────────────────────────────────────────────────────────────────
vim.keymap.set("n", "<leader>p", function()
	require("telescope.builtin").find_files()
end, { desc = "Find files" })
vim.keymap.set("n", "<leader><leader>", function()
	require("telescope.builtin").live_grep()
end, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", function()
	require("telescope.builtin").buffers()
end, { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fh", function()
	require("telescope.builtin").help_tags()
end, { desc = "Help tags" })
vim.keymap.set("n", "<leader>ds", function()
	require("telescope.builtin").diagnostics()
end, { desc = "Workspace diagnostics" })

-- ─── Formatting (conform) ─────────────────────────────────────────────────────
vim.keymap.set({ "n", "v" }, "<leader>f", function()
	require("conform").format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	})
end, { desc = "Format file or selection" })

-- ─── Buffer ───────────────────────────────────────────────────────────────────
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Close buffer" })

-- ─── Linting ──────────────────────────────────────────────────────────────────
vim.keymap.set("n", "<leader>l", function()
	require("lint").try_lint()
end, { desc = "Trigger linting for current file" })

-- ─── Git (gitsigns) ───────────────────────────────────────────────────────────
vim.keymap.set("n", "<leader>hp", function()
	require("gitsigns").preview_hunk()
end, { desc = "Preview hunk" })
vim.keymap.set("n", "<leader>hs", function()
	require("gitsigns").stage_hunk()
end, { desc = "Stage hunk" })
vim.keymap.set("n", "<leader>hu", function()
	require("gitsigns").undo_stage_hunk()
end, { desc = "Undo stage hunk" })
vim.keymap.set("n", "<leader>hb", function()
	require("gitsigns").blame_line()
end, { desc = "Blame line" })

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
		map("n", "<leader>r", vim.lsp.buf.rename, "Rename symbol")
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
