local keymap = vim.keymap

keymap.set("v", "<leader>y", '"+y', { desc = "Copy selection to system clipboard" })
keymap.set("n", "<Tab>", "<cmd>bnext<CR>", { silent = true })
keymap.set("n", "<S-Tab>", "<cmd>bprev<CR>", { silent = true })
keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Close buffer" })
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
