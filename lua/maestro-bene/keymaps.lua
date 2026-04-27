local keymap = vim.keymap -- for conciseness

-- Dashboard
keymap.set("n", "<leader>h", ":Dashboard", { desc = "Go Home" })

-- Telescope
local telescope = require("telescope")
local builtin = require("telescope.builtin")

-- LSP Navigation avec Telescope
keymap.set("n", "gd", builtin.lsp_definitions, { desc = "Go to definition" })
keymap.set("n", "gr", builtin.lsp_references, { desc = "Show references" })
keymap.set("n", "gi", builtin.lsp_implementations, { desc = "Go to implementation" })
keymap.set("n", "gt", builtin.lsp_type_definitions, { desc = "Go to type definition" })

-- Diagnostics avec Telescope
keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Show diagnostics" })

keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Fuzzy find files in cwd" })
keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Fuzzy find recent files" })
keymap.set("n", "<leader>fm", builtin.man_pages, { desc = "Fuzzy find man pages" })
keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Find string in cwd" })
keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "Find string under cursor in cwd" })

-- Symbols avec Telescope
keymap.set("n", "<leader>fS", builtin.lsp_workspace_symbols, { desc = "Workspace symbols" })

-- Git avec Telescope
keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Git branches" })
keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Git commits" })
keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Git files" })
keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Git status" })

-- Buffers/Tabs
keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Find keymaps" })
keymap.set("n", "<leader>fo", builtin.vim_options, { desc = "Vim options" })


keymap.set("n", "<leader>ee", function()
  telescope.extensions.file_browser.file_browser({
    path = vim.fn.expand("%:p:h"),
    select_buffer = true
  })
end, { desc = "Open Telescope File Browser" })

keymap.set("n", "<leader>gcl", telescope.extensions.neoclip.default, { desc = "Neoclip" })
keymap.set("n", "<leader>fn", telescope.extensions.notify.notify, { desc = "Notify" })
keymap.set("n", "<leader>gcf", telescope.extensions.conflicts.conflicts, { desc = "Git conflicts" })
keymap.set("n", "<leader>fz", telescope.extensions.zoxide.list, { desc = "Fuzzy find Zoxide" })

-- Conform
local conform = require("conform")
keymap.set({ "n", "v" }, "<leader>ft", function()
  conform.format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  })
end, { desc = "Format file or range (in visual mode)" })
