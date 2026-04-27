return {
	"nvimtools/none-ls.nvim", -- configure formatters & linters
	lazy = true,
	event = { "BufReadPre", "BufNewFile" }, -- to enable uncomment this
	dependencies = {
		"jay-babu/mason-null-ls.nvim",
	},
	config = function()
		local mason_null_ls = require("mason-null-ls")

		local null_ls = require("null-ls")

		local null_ls_utils = require("null-ls.utils")

		mason_null_ls.setup({
			ensure_installed = {
				"black", -- python formatter
				"goimports", -- go imports fmt
				"gofumpt", -- go fmt
				"prettier", -- prettier formatter
				"phpcs", -- php linter
				"phpcsfixer", -- php formatter
				"phpcs", -- php linter
				"quick-lint-js", --js linter
				"stylua", -- lua formatter
				"trivy", -- System linter (containers etc)
			},
		})

		-- for debugging, and to know which method a server has available
		local function log_to_file(msg)
			local f = io.open("/tmp/nvim_debug.log", "a")
			f:write(msg .. "\n")
			f:close()
		end
		-- for conciseness
		local formatting = null_ls.builtins.formatting -- to setup formatters
		local diagnostics = null_ls.builtins.diagnostics -- to setup linters

		-- to setup format on save
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		local formatting_server_names = {
			"stylua",
			"black",
			"goimports",
			"gofumpt",
			"isort",
			"mix",
			"phpcsfixer",
		}
		local diagnosting_server_names = { "phpcs", "quick_lint_js", "trivy" }

		local sources = {}

		for _, server in ipairs(formatting_server_names) do
			if formatting[server] then
				table.insert(sources, formatting[server])
			end
		end
		for _, server in ipairs(diagnosting_server_names) do
			if diagnostics[server] then
				if server == "eslint_d" then
					table.insert(
						sources,
						diagnostics[server].with({
							condition = function(utils)
								return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs" })
							end,
						})
					)
				else
					table.insert(sources, diagnostics[server])
				end
			end
		end

		log_to_file("Final list of sources: ")
		log_to_file(vim.inspect(sources))

		-- configure null_ls
		null_ls.setup({
			root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json", ".yaml"),
			sources = sources,
			-- configure format on save
			on_attach = function(current_client, bufnr)
				if current_client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								filter = function(client)
									--  only use null-ls for formatting instead of lsp server
									return client.name == "null-ls"
								end,
								bufnr = bufnr,
							})
						end,
					})
				end
			end,
		})
	end,
}
