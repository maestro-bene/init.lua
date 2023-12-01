return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap -- for conciseness

		local lsps_default_config = {
			"clangd",
			"cssls",
			"golangci_lint_ls",
			"gopls",
			"html",
			"pyright",
			"rust_analyzer",
			"tsserver",
		}

		local lsps_to_configure = {
			"elixirls",
			"lua_ls",
		}

		local opts = { noremap = true, silent = true }
		local on_attach = function(client, bufnr)
			opts.buffer = bufnr

			-- set keybinds
			opts.desc = "Show LSP references"
			keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

			opts.desc = "Go to declaration"
			keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

			opts.desc = "Show LSP definitions"
			keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

			opts.desc = "Show LSP implementations"
			keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

			opts.desc = "Show LSP type definitions"
			keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

			opts.desc = "See available code actions"
			keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

			opts.desc = "Smart rename"
			keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

			opts.desc = "Show buffer diagnostics"
			keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

			opts.desc = "Show line diagnostics"
			keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

			opts.desc = "Go to previous diagnostic"
			keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

			opts.desc = "Go to next diagnostic"
			keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

			opts.desc = "Show documentation for what is under cursor"
			keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

			opts.desc = "Restart LSP"
			keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

			keymap.set(
				"n",
				"<leader>di",
				"<Cmd>lua require'jdtls'.organize_imports()<CR>",
				{ buffer = bufnr, desc = "Organize Imports" }
			)
			keymap.set(
				"n",
				"<leader>dt",
				"<Cmd>lua require'jdtls'.test_class()<CR>",
				{ buffer = bufnr, desc = "Test Class" }
			)
			keymap.set(
				"n",
				"<leader>dn",
				"<Cmd>lua require'jdtls'.test_nearest_method()<CR>",
				{ buffer = bufnr, desc = "Test Nearest Method" }
			)
			keymap.set(
				"v",
				"<leader>de",
				"<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>",
				{ buffer = bufnr, desc = "Extract Variable" }
			)
			keymap.set(
				"n",
				"<leader>de",
				"<Cmd>lua require('jdtls').extract_variable()<CR>",
				{ buffer = bufnr, desc = "Extract Variable" }
			)
			keymap.set(
				"v",
				"<leader>dm",
				"<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>",
				{ buffer = bufnr, desc = "Extract Method" }
			)
		end

		-- used to enable autocompletion (assign to every lspsserver config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- configure lsp servers
		for _, my_lsp in ipairs(lsps_default_config) do
			lspconfig[my_lsp].setup({
				capabilities = capabilities,
				on_attach = on_attach(),
			})
		end
		for _, my_lsp_tc in ipairs(lsps_to_configure) do
			local settings = {} -- Initialize settings to an empty table
			if my_lsp_tc == "lua_ls" then
				lspconfig[my_lsp_tc].setup({
					on_attach = on_attach(),
					settings = { -- custom settings for lua
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
							workspace = {
								library = {
									[vim.fn.expand("$VIMRUNTIME/lua")] = true,
									[vim.fn.stdpath("config") .. "/lua"] = true,
								},
							},
						},
					},
				})
			elseif my_lsp_tc == "elixirls" then
				lspconfig[my_lsp_tc].setup({
					capabilities = capabilities,
					on_attach = on_attach(),
					cmd = { "/Users/maestro-bene/.local/share/nvim/mason/packages/elixir-ls/language_server.sh" },
				})
			else
				lspconfig[my_lsp_tc].setup({
					capabilities = capabilities,
					on_attach = on_attach(),
					settings = settings,
				})
			end
		end
	end,
}