local function root_dir(fname)
	return vim.fs.root(fname, { ".git" }) or vim.loop.cwd()
end

local shared_capabilities = vim.lsp.protocol.make_client_capabilities()
local ok, blink = pcall(require, "blink.cmp")
if ok then
	shared_capabilities = blink.get_lsp_capabilities(shared_capabilities)
end

vim.lsp.config("copilot", require("lsp.copilot"))

vim.lsp.enable({
	-- "elixirls",
	"lua_ls",
	-- "omnisharp",
	-- "clangd",
	-- "cssls",
	-- "golangci_lint_ls",
	-- "gopls",
	-- "html",
	-- "pylsp",
	"jedi_language_server",
	-- "rust_analyzer",
	-- "ts_ls",
	-- "jdtls",
	-- "kotlin_language_server",
	"intelephense",
	"shellharden",
	"shfmt",
	"copilot",
})

vim.lsp.config("*", {
	capabilities = shared_capabilities,
	root_dir = root_dir,
	single_file_support = true,
})

vim.diagnostic.config({
	-- virtual_lines = true,
	virtual_text = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = true,
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = "ErrorMsg",
			[vim.diagnostic.severity.WARN] = "WarningMsg",
		},
	},
})
