vim.lsp.enable({
    "elixirls",
    "lua_ls",
    "omnisharp",
    "clangd",
    "cssls",
    "golangci_lint_ls",
    "gopls",
    "html",
    "pylsp",
    "rust_analyzer",
    "ts_ls",
    "jdtls",
    "kotlin_language_server",
    -- "intelephense",
    "phpactor",
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
