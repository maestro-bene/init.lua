return {
	"nvim-telescope/telescope.nvim",
	event = "VeryLazy",
	tag = "v0.2.1",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"nvim-lua/popup.nvim",

		-- Fuzzy finder
		"ibhagwan/fzf-lua",
		"nvim-telescope/telescope-fzf-native.nvim",

		-- File Browser
		"nvim-telescope/telescope-file-browser.nvim",

		-- Conventional Commits
		"olacin/telescope-cc.nvim",

		-- Git Conflicts
		"Snikimonkd/telescope-git-conflicts.nvim",

		-- Clipboard manager
		"AckslD/nvim-neoclip.lua",

		"nvim-treesitter/nvim-treesitter",

		-- Media previewer
		"nvim-telescope/telescope-media-files.nvim",

		-- Zoxide
		"jvgrootveld/telescope-zoxide",
	},

	config = function()
		local keymap = vim.keymap
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")
		local z_utils = require("telescope._extensions.zoxide.utils")

		local exclude_dirs = {
			".asdf",
			".obsidian",
			".vim/bundle",
			".docker",
			"__pycache__",
			"node_modules",
			"Library",
			"Downloads",
			".local",
			".cache",
			".git",
			".npm",
			".rustup",
			"Movies",
			".cargo/registry",
			"go",
			"Applications",
			"deps",
			"data",
			".meta",
			"vendor",
			".venv",
		}

		local exclude_globs = {
			"!**/public/bundles/**",
			"!**/var/cache/**",
			"!**__init__.py",
		}

		local binary_exts = {
			"png",
			"jpg",
			"jpeg",
			"gif",
			"pdf",
			"csv",
			"bmp",
			"ico",
			"svg",
			"webp",
			"tiff",
			"psd",
			"mp4",
			"mkv",
			"avi",
			"mov",
			"webm",
			"flv",
			"wmv",
			"mpeg",
			"mp3",
			"wav",
			"ogg",
			"flac",
			"aac",
			"m4a",
			"zip",
			"tar",
			"gz",
			"bz2",
			"xz",
			"rar",
			"7z",
			"tgz",
			"tar.gz",
			"exe",
			"dll",
			"so",
			"bin",
			"o",
			"a",
			"out",
			"class",
			"jar",
			"pyc",
			"pyo",
			"apk",
			"dylib",
			"app",
			"deb",
			"rpm",
			"msi",
			"ttf",
			"otf",
			"woff",
			"woff2",
			"iso",
			"img",
			"vmdk",
			"kbx",
			"qcow2",
		}

		local find_command = { "rg", "--files", "--hidden" }

		-- Exclude directories
		for _, dir in ipairs(exclude_dirs) do
			table.insert(find_command, "--glob")
			table.insert(find_command, "!" .. dir)
		end

		-- Exclude custom globs
		for _, glob in ipairs(exclude_globs) do
			table.insert(find_command, "--glob")
			table.insert(find_command, glob)
		end

		-- Exclude binary extensions
		for _, ext in ipairs(binary_exts) do
			table.insert(find_command, "--glob")
			table.insert(find_command, "!**." .. ext)
		end

		telescope.setup({
			pickers = {
				find_files = {
					hidden = true,
					find_command = find_command,
				},
			},
			vimgrep_arguments = {
				"rg",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
			},
			defaults = {
				path_display = { "truncate " },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						["<C-g>"] = function(prompt_bufnr)
							local selection = require("telescope.actions.state").get_selected_entry()
							local dir = vim.fn.fnamemodify(selection.path, ":p:h")
							require("telescope.actions").close(prompt_bufnr)
							-- Depending on what you want put `cd`, `lcd`, `tcd`
							vim.cmd(string.format("silent lcd %s/..", dir))
						end,
						["<C-p>"] = function(prompt_bufnr)
							local selection = require("telescope.actions.state").get_selected_entry()
							local dir = vim.fn.fnamemodify(selection.path, ":p:h")
							require("telescope.actions").close(prompt_bufnr)
							-- Depending on what you want put `cd`, `lcd`, `tcd`
							vim.cmd(string.format("silent lcd %s", dir))
						end,
					},
					n = {
						["cd"] = function(prompt_bufnr)
							local selection = require("telescope.actions.state").get_selected_entry()
							local dir = vim.fn.fnamemodify(selection.path, ":p:h")
							require("telescope.actions").close(prompt_bufnr)
							-- Depending on what you want put `cd`, `lcd`, `tcd`
							vim.cmd(string.format("silent lcd %s", dir))
						end,
					},
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
					},
				},
				media_files = {
					-- filetypes whitelist
					-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
					filetypes = { "png", "webp", "jpg", "jpeg", "svg" },
					-- find command (defaults to `fd`)
					find_cmd = "rg",
				},
			},
		})

		require("neoclip").setup()

		-- Set keymaps
		keymap.set("n", "<leader>ff", "<CMD>Telescope find_files<CR>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fr", "<CMD>Telescope oldfiles<CR>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fs", "<CMD>Telescope live_grep<CR>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>fc", "<CMD>Telescope grep_string<CR>", { desc = "Find string under cursor in cwd" })
		keymap.set("n", "<leader>fm", "<CMD>Telescope media_files<CR>", { desc = "Fuzzy find media files in cwd" })

		-- open file_browser with the path of the current buffer
		keymap.set(
			"n",
			"<leader>ee",
			"<CMD>Telescope file_browser path=%:p:h select_buffer=true<CR>",
			{ desc = "Open in Browser" }
		)

		keymap.set("n", "<leader>gcl", "<CMD>Telescope neoclip<CR>", { desc = "Neoclip" })

		keymap.set("n", "<leader>fn", "<CMD>Telescope notify<CR>", { desc = "Notify" })

		keymap.set("n", "<leader>gcc", "<CMD>Telescope conventional_commits<CR>", { desc = "conventional_commits" })
		keymap.set("n", "<leader>gcf", "<CMD>Telescope conflicts<CR>", { desc = "conflicts" })

		keymap.set("n", "<leader>fz", require("telescope").extensions.zoxide.list, { desc = "Fuzzy find Zoxide" })
	end,
}
