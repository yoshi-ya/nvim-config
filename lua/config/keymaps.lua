local keymap = vim.keymap

-- ─── Clipboard ───────────────────────────────────────────────────────────────
keymap.set("v", "<leader>y", '"+y', { desc = "Copy selection to system clipboard" })

-- ─── Buffer Navigation ───────────────────────────────────────────────
keymap.set("n", "<Tab>", "<cmd>bnext<CR>", { silent = true })
keymap.set("n", "<S-Tab>", "<cmd>bprev<CR>", { silent = true })

-- ─── Buffer ───────────────────────────────────────────────────────────────────
keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Close buffer" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
