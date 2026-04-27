return {
    { "L3MON4D3/LuaSnip", keys = {} },
    {
        "saghen/blink.cmp",
        dependencies = {
            "rafamadriz/friendly-snippets",
        },
        version = "*",
        config = function()
            require("blink.cmp").setup({
                snippets = { preset = "luasnip" },
                signature = { enabled = true },
                appearance = {
                    use_nvim_cmp_as_default = false,
                    nerd_font_variant = "normal",
                },
                sources = {
                    default = { "lsp", "path", "snippets", "buffer", "minuet" },
                    providers = {
                        cmdline = {
                            min_keyword_length = 2,
                        },
                        minuet = {
                            name = 'minuet',
                            module = 'minuet.blink',
                            async = true,
                            -- Should match minuet.config.request_timeout * 1000,
                            -- since minuet.config.request_timeout is in seconds
                            timeout_ms = 3000,
                            score_offset = 50, -- Gives minuet higher priority among suggestions
                        },
                    },
                },
                keymap = {
                    ["<C-f>"] = {},
                    -- Manually invoke minuet completion.
                    ['<A-y>'] = require('minuet').make_blink_map()
                },
                cmdline = {
                    enabled = true,
                    completion = { menu = { auto_show = true } },
                    keymap = {
                        ["<CR>"] = { "accept_and_enter", "fallback" },
                    },
                },
                completion = {
                    trigger = { prefetch_on_insert = false },
                    menu = {
                        border = nil,
                        scrolloff = 1,
                        scrollbar = false,
                        draw = {
                            columns = {
                                { "kind_icon" },
                                { "label",      "label_description", gap = 1 },
                                { "kind" },
                                { "source_name" },
                            },
                        },
                    },
                    documentation = {
                        window = {
                            border = nil,
                            scrollbar = false,
                            winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc',
                        },
                        auto_show = true,
                        auto_show_delay_ms = 500,
                    },
                },
            })

            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },
}
