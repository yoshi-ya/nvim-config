-- Editor options and global variables. Loaded first, before any plugin spec.

-- Leader keys must be set before lazy.nvim loads, because plugin `keys` specs
-- resolve `<leader>` at spec-load time.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Respect .editorconfig files.
vim.g.editorconfig = true

-- Force jdtls to report diagnostics in English regardless of system locale.
vim.env.JDTLS_JVM_ARGS = "-Duser.language=en -Duser.country=US"

-- Indentation: 4 spaces.
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Line numbers: absolute on the cursor line, relative elsewhere.
vim.opt.number = true
vim.opt.relativenumber = true
