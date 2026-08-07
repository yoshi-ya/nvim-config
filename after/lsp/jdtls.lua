-- Merged over nvim-lspconfig's `lsp/jdtls.lua` (this file sits in `after/`, so it wins).
---@type vim.lsp.Config
return {
	settings = {
		java = {
			-- No `configuration.runtimes`: jdtls compiles with the JDK from $JAVA_HOME (jenv).
			completion = {
				-- Import order groups, blank line between each. "#" is the static block.
				importOrder = { "#", "java", "javax", "org", "com" },
			},
			sources = {
				organizeImports = {
					-- Match IntelliJ: collapse a package into `.*` only from 3 static
					-- members up; never collapse regular type imports.
					starThreshold = 99,
					staticStarThreshold = 3,
				},
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
