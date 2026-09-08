-- Global keymaps. Plugin keymaps live in that plugin's `keys` spec.

local keymap = vim.keymap

-- Buffers
keymap.set("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Next buffer", silent = true })
keymap.set("n", "<S-Tab>", "<cmd>bprev<CR>", { desc = "Previous buffer", silent = true })
keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Close buffer" })

-- Windows
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })

-- Search
keymap.set("n", "<leader>nh", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

-- Clipboard
keymap.set("v", "<leader>y", '"+y', { desc = "Copy selection to system clipboard" })

local function copy_path(modifier)
	return function()
		local path = vim.fn.expand("%:" .. modifier)
		vim.fn.setreg("+", path)
		vim.notify("Copied " .. path)
	end
end

keymap.set("n", "<leader>yp", copy_path("p"), { desc = "Copy absolute file path" })
keymap.set("n", "<leader>yr", copy_path("."), { desc = "Copy file path relative to cwd" })
keymap.set("n", "<leader>yn", copy_path("t"), { desc = "Copy file name" })
keymap.set("n", "<leader>yd", copy_path("h"), { desc = "Copy directory path" })

-- Symbols
keymap.set("i", "<leader>we", "✓", { desc = "Write a check mark ✓" })
