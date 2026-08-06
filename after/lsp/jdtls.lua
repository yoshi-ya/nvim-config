-- Merged over nvim-lspconfig's `lsp/jdtls.lua` (this file sits in `after/`, so it wins).
---@type vim.lsp.Config
return {
	settings = {
		java = {
			-- No `configuration.runtimes`: jdtls compiles with the JDK from $JAVA_HOME (jenv).
			completion = {
				-- Import order: java → javax → org → com → others → static
				importOrder = "java;javax;org;com;;#",
			},
		},
	},
	init_options = {
		-- One jdtls workspace per project directory name.
		workspace = vim.fs.joinpath(
			vim.fn.stdpath("cache") --[[@as string]],
			"jdtls",
			"workspace",
			vim.fn.fnamemodify(vim.uv.cwd() or "", ":t") --[[@as string]]
		),
	},
	before_init = require("lsp.java-formatter").before_init,
}
