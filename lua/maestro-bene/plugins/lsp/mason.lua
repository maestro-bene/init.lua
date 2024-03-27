return {
	"williamboman/mason.nvim",
	event = "VeryLazy",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "󰌚 ",
					package_uninstalled = "✗",
				},
				border = "rounded",
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"clangd",
				"cssls",
				"elixirls",
				"golangci_lint_ls",
				"gopls",
				"html",
				"lua_ls",
				"pylsp",
				"rust_analyzer",
				"tsserver",
				"intelephense",
				"phpactor",
				"jdtls",
			},
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same as ensure_installed
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"black", -- python formatter
				"eslint_d", -- js linter
				"gofumpt", -- go formatter
				"goimports", -- go imports fmt
				"isort", -- python formatter
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"trivy",
			},
		})
	end,
}
