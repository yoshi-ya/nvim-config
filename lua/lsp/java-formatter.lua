-- Path (relative to the project root) of the IntelliJ-exported Eclipse formatter profile.dia
local FORMATTER_XML = { ".idea", "eclipse-java-formatter.xml" }

-- Profile name inside the exported XML. IntelliJ writes its scheme under "Project".
local FORMATTER_PROFILE = "Project"

local M = {}

--- Absolute path of the formatter XML in `root`, or nil when absent/unreadable.
---@param root string|nil
---@return string|nil
local function find_formatter_xml(root)
	if not root or root == "" then
		return nil
	end

	local xml = vim.fs.joinpath(root, unpack(FORMATTER_XML))
	return vim.fn.filereadable(xml) == 1 and xml or nil
end

--- jdtls `before_init` hook: point jdtls at the project's Eclipse formatter
--- profile when one is checked in, otherwise leave settings untouched.
function M.before_init(_, config)
	local xml = find_formatter_xml(config.root_dir)
	if not xml then
		return
	end

	config.settings = vim.tbl_deep_extend("force", config.settings or {}, {
		java = {
			format = {
				settings = {
					url = vim.uri_from_fname(xml),
					profile = FORMATTER_PROFILE,
				},
			},
		},
	})
end

return M
