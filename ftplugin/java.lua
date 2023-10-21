vim.opt_local.tabstop = 2 -- 2 spaces for tabs (prettier default)
vim.opt_local.shiftwidth = 2 -- 2 spaces for indent width
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local config = {
	cmd = { "/opt/homebrew/bin/jdtls" },
	root_dir = vim.fs.dirname(vim.fs.find({
		".git",
		"mvnw",
		"gradlew",
		"pom.xml",
		"build.gradle",
	}, { upward = true })[1]),
	settings = {
		java = {
			format = {
				tabSize = 4, -- doens't work idk y
			},
		},
	},
	capabilities = cmp_nvim_lsp.default_capabilities(),
}
require("jdtls").start_or_attach(config)
