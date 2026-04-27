return {
	"nvim-telescope/telescope.nvim",
	event = "VeryLazy",
	tag = "0.1.5",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"nvim-treesitter/nvim-treesitter",
		"nvim-telescope/telescope-github.nvim",
		"cljoly/telescope-repo.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local z_utils = require("telescope._extensions.zoxide.utils")

		telescope.setup({
			defaults = {
				path_display = { "truncate " },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
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
				bookmarks = {},
				zoxide = {
					mappings = {
						["<CR>"] = { action = z_utils.create_basic_command("edit") },
					},
				},
				gpt = {
					title = "Gpt Actions",
					commands = {
						"add_tests",
						"chat",
						"docstring",
						"explain_code",
						"fix_bugs",
						"grammar_correction",
						"interactive",
						"optimize_code",
						"summarize",
						"translate",
					},
					theme = require("telescope.themes").get_dropdown({}),
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("bookmarks")
		telescope.load_extension("zoxide")
		telescope.load_extension("repo")
		telescope.load_extension("neoclip")
		telescope.load_extension("gh")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		keymap.set("n", "<leader>fb", "<cmd>Telescope bookmarks<cr>", { desc = "Find and open a bookmark" })

		keymap.set("n", "<leader>fz", require("telescope").extensions.zoxide.list, { desc = "Fzf Zoxide" })
		keymap.set("n", "<leader>fg", require("telescope").extensions.repo.list, { desc = "Fzf Repos" })
		keymap.set("n", "<leader>fh", require("telescope").extensions.repo.cached_list, { desc = "Fzf Repos cached" })
		keymap.set("n", "<leader>gc", "<cmd>Telescope neoclip<cr>", { desc = "Neoclip" })
		keymap.set("n", "<leader>gi", "<cmd>Telescope gh issues<cr>", { desc = "Fuzzy find github issues" })
		keymap.set(
			"n",
			"<leader>gpr",
			"<cmd>Telescope gh pull_request<cr>",
			{ desc = "Fuzzy find github pull requests" }
		)
		keymap.set("n", "<leader>gg", "<cmd>Telescope gh gist<cr>", { desc = "Fuzzy find github gist" })
		keymap.set("n", "<leader>gr", "<cmd>Telescope gh run<cr>", { desc = "Run github" })
		keymap.set("n", "<leader>c<leader>", "<cmd>Telescope gpt<cr>", { desc = "Fuzzy find ChatGPT Run" })
		keymap.set("n", "<leader>ny", "<cmd>Telescope notify<cr>", { desc = "Notify" })
	end,
}
