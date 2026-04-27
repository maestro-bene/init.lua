return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.2",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
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
				},
			},
			extensions = {
				bookmarks = {
					-- Provide the options here to override the default values.
					selected_browser = "safari",
				},
				zoxide = {
					mappings = {
						["<CR>"] = { action = z_utils.create_basic_command("edit") },
					},
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("bookmarks")
		telescope.load_extension("zoxide")
		telescope.load_extension("repo")
		telescope.load_extension("neoclip")
		--
		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		keymap.set(
			"n",
			"<leader>fb",
			"<cmd>lua require('telescope').extensions.bookmarks.bookmarks()<cr>",
			{ desc = "Find and open a bookmark" }
		)
		vim.keymap.set("n", "<leader>fz", require("telescope").extensions.zoxide.list)
		vim.keymap.set("n", "<leader>fg", require("telescope").extensions.repo.list)
		vim.keymap.set("n", "<leader>fh", require("telescope").extensions.repo.cached_list)
		vim.keymap.set("n", "<leader>cl", "<cmd>Telescope neoclip<cr>")
	end,
}
