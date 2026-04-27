return {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    tag = "0.1.8",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "nvim-lua/popup.nvim",

        -- Fuzzy finder
        "ibhagwan/fzf-lua",
        "nvim-telescope/telescope-fzf-native.nvim",

        -- Browser bookmark find and open
        {
            "dhruvmanila/browser-bookmarks.nvim",
            lazy = true,
            version = "*",
            opts = {
                selected_browser = "brave",
            },
        },

        -- File Browser
        "nvim-telescope/telescope-file-browser.nvim",

        -- Conventional Commits
        "olacin/telescope-cc.nvim",

        -- Clipboard manager
        "AckslD/nvim-neoclip.lua",

        "nvim-treesitter/nvim-treesitter",

        -- Git repo and github
        "nvim-telescope/telescope-github.nvim",
        "cljoly/telescope-repo.nvim",

        -- Zoxide
        "jvgrootveld/telescope-zoxide",
    },

    config = function()
        local keymap = vim.keymap
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local builtin = require("telescope.builtin")
        local z_utils = require("telescope._extensions.zoxide.utils")

        telescope.setup({
            defaults = {
                path_display = { "truncate " },
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                        ["<C-j>"] = actions.move_selection_next,     -- move to next result
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                    },
                },
                file_ignore_patterns = {
                    ".*build/",
                    ".*build$",
                    "__pycache__",
                    "node_modules",
                    "Library/.*",
                    "Downloads/",
                    ".local/",
                    ".cache/",
                    ".git/",
                    ".rustup/",
                    "Movies/",
                    ".cargo/registry",
                    "go/.*",
                    "Applications/.*",
                    "deps/.*",
                    "data/.*",
                    ".meta",
                },
            },
            extensions = {
                file_browser = {
                    theme = "ivy",
                    hijack_netrw = true,
                    mappings = {
                        ["i"] = {},
                        ["n"] = {},
                    },
                },
                zoxide = {
                    event = "VeryLazy",
                    prompt_title = "[ Zoxide List ]",

                    -- Zoxide list command with score
                    list_command = "zoxide query -ls",
                    mappings = {
                        default = {
                            action = function(selection)
                                vim.cmd.cd(selection.path)
                            end,
                            after_action = function(selection)
                                vim.notify("Directory changed to " .. selection.path)
                            end,
                        },
                        ["<C-s>"] = { action = z_utils.create_basic_command("split") },
                        ["<C-v>"] = { action = z_utils.create_basic_command("vsplit") },
                        ["<C-e>"] = { action = z_utils.create_basic_command("edit") },
                        ["<C-f>"] = {
                            keepinsert = true,
                            action = function(selection)
                                builtin.find_files({ cwd = selection.path })
                            end,
                        },
                        ["<C-t>"] = {
                            action = function(selection)
                                vim.cmd.tcd(selection.path)
                            end,
                        },
                    }
                },
            },
        })

        telescope.load_extension("fzf")
        telescope.load_extension("bookmarks")
        telescope.load_extension("zoxide")
        telescope.load_extension("neoclip")
        telescope.load_extension("gh")
        telescope.load_extension("conventional_commits")
        telescope.load_extension("file_browser")

        -- set keymaps

        keymap.set("n", "<leader>ff", "<CMD>Telescope find_files<CR>", { desc = "Fuzzy find files in cwd" })
        keymap.set("n", "<leader>fr", "<CMD>Telescope oldfiles<CR>", { desc = "Fuzzy find recent files" })
        keymap.set("n", "<leader>fs", "<CMD>Telescope live_grep<CR>", { desc = "Find string in cwd" })
        keymap.set("n", "<leader>fc", "<CMD>Telescope grep_string<CR>", { desc = "Find string under cursor in cwd" })
        keymap.set("n", "<leader>fb", "<CMD>Telescope bookmarks<CR>", { desc = "Find and open a bookmark" })

        -- open file_browser with the path of the current buffer
        keymap.set("n", "<leader>ee", "<CMD>Telescope file_browser path=%:p:h select_buffer=true<CR>")


        keymap.set("n", "<leader>gcl", "<CMD>Telescope neoclip<CR>", { desc = "Neoclip" })

        keymap.set("n", "<leader>gi", "<CMD>Telescope gh issues<CR>", { desc = "Fuzzy find github issues" })
        keymap.set("n", "<leader>gpr", "<CMD>Telescope gh pull_request<CR>", { desc = "Fuzzy find github pull requests" })
        keymap.set("n", "<leader>gg", "<CMD>Telescope gh gist<CR>", { desc = "Fuzzy find github gist" })
        keymap.set("n", "<leader>gr", "<CMD>Telescope gh run<CR>", { desc = "Run github" })

        keymap.set("n", "<leader>gcc", "<CMD>Telescope conventional_commits<CR>", { desc = "conventional_commits" })

        keymap.set("n", "<leader>fz", require("telescope").extensions.zoxide.list, { desc = "Fuzzy find Zoxide" })
    end,
}
