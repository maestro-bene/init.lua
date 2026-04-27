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

        -- ✓ sqlls
        -- ✓ python-lsp-server pylsp
        -- ✓ trivy
        -- ✓ typescript-language-server ts_ls
        -- ✓ stylua
        -- ✓ rust-analyzer rust_analyzer
        -- ✓ prettier
        -- ✓ phpcs
        -- ✓ phpcbf
        -- ✓ phpactor
        -- ✓ php-cs-fixer
        -- ✓ nextls
        -- ✓ ktlint
        -- ✓ lemminx
        -- ✓ lua-language-server lua_ls
        -- ✓ intelephense
        -- ✓ kotlin-language-server kotlin_language_server
        -- ✓ gopls
        -- ✓ jdtls
        -- ✓ isort
        -- ✓ black
        -- ✓ golangci-lint
        -- ✓ golangci-lint-langserver golangci_lint_ls
        -- ✓ goimports
        -- ✓ gofumpt
        -- ✓ clangd
        -- ✓ clang-format
        -- ✓ eslint_d
        -- ✓ elixir-ls elixirls
        -- ✓ css-lsp cssls
        -- ✓ html-lsp html
        -- ✓ quick-lint-js quick_lint_js

        mason_lspconfig.setup({
            -- list of servers for mason to install
            ensure_installed = {
                "clangd",
                "cssls",
                -- "elixirls",
                "golangci_lint_ls",
                "gopls",
                "html",
                "lua_ls",
                "pylsp",
                "jdtls",
            },
            -- auto-install configured servers (with lspconfig)
            automatic_installation = true, -- not the same as ensure_installed
        })

        mason_tool_installer.setup({
            ensure_installed = {
                "black",     -- python formatter
                "eslint_d",  -- js linter
                "gofumpt",   -- go formatter
                "goimports", -- go imports fmt
                "isort",     -- python formatter
                "prettier",  -- prettier formatter
                "stylua",    -- lua formatter
                "trivy",
            },
        })
    end,
}
