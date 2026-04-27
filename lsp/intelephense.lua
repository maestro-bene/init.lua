return {
	cmd = { "intelephense", "--stdio" },
	filetypes = { "php" },
	root_markers = { ".git", "composer.json", "vendor/", "phpunit.xml" },
	settings = {
		intelephense = {
			files = {
				maxSize = 1000000,
			},
			environment = {
				phpVersion = "8.2.29", -- Ajuster
			},
		},
	},
	single_file_support = true,
	log_level = vim.lsp.protocol.MessageType.Error,
}
