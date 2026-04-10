return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local ok, ts_configs = pcall(require, "nvim-treesitter.configs")
			if not ok then
				return
			end

			ts_configs.setup({
				ensure_installed = { "python", "java", "javadoc", "lua", "bash", "json", "yaml", "javascript", "typescript", "tsx", "regex", "dockerfile", "xml", "ini", "html", "gitignore", "angular" },
				highlight = { enable = true },
				indent = { enable = true },
				incremental_selection = { enable = true },
				rainbow = { enable = true },
			})
		end,
	},
}
