return {
	cmd = { "copilot-language-server", " --stdio" },
	filetypes = { "*" },
	root_dir = root_dir,
	single_file_support = true,
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		if client:supports_method(vim.lsp.protocol.Methods.textDocument_inlineCompletion, bufnr) then
			vim.lsp.inline_completion.enable(true, { bufnr = bufnr })
			vim.keymap.set("i", "<M-]>", function()
				vim.lsp.inline_completion.select({ count = 1 })
			end, { buffer = bufnr, desc = "Copilot inline suivant" })
			vim.keymap.set("i", "<M-[>", function()
				vim.lsp.inline_completion.select({ count = -1 })
			end, { buffer = bufnr, desc = "Copilot inline précédent" })
			vim.keymap.set(
				"i",
				"<C-f>",
				vim.lsp.inline_completion.get,
				{ buffer = bufnr, desc = "Accepter la suggestion" }
			)
		end
	end,
}
