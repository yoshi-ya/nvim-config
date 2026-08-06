-- Language servers Mason installs and Neovim enables.
-- Per-server overrides live in `after/lsp/<name>.lua` (auto-merged over nvim-lspconfig defaults).
return {
	"lua_ls",
	"pyright",
	"ts_ls",
	"html",
	"angularls",
	"jsonls",
	"jdtls",
	"dockerls",
	"docker_compose_language_service",
	"lemminx",
	"yamlls",
	"marksman",
}
