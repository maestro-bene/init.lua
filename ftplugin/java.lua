vim.opt_local.tabstop = 2 -- 2 spaces for tabs (prettier default)
vim.opt_local.shiftwidth = 2 -- 2 spaces for indent width
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local config = {
	cmd = { "/opt/homebrew/bin/jdtls" },
	root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),
	settings = {
		java = {},
	},
	capabilities = cmp_nvim_lsp.default_capabilities(),
}
require("jdtls").start_or_attach(config)
