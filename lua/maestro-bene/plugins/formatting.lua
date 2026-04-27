return {
	"stevearc/conform.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				c = { "astyle", "clang_format" },
				cpp = { "astyle" },
				css = { "prettier" },
				elixir = { "mix" },
				go = { "gofumpt", "goimports", "golines" },
				html = { "prettier" },
				java = { "jdtls" },
				javascript = { "prettier", "eslint_d" },
				javascriptreact = { "prettier" },
				json = { "prettier" },
				lua = { "stylua" },
				markdown = { "prettier" },
				php = { "php_cs_fixer" },
				python = { "isort", "black" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				yaml = { "prettier" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>fm", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
