require('refactoring').setup({})

vim.api.nvim_set_keymap("v", "<leader>ri", [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})

vim.keymap.set("v", "<leader>re", ":Refactor extract ")
vim.keymap.set("v", "<leader>rf", ":Refactor extract_to_file ")

vim.keymap.set("v", "<leader>rv", ":Refactor extract_var ")

vim.keymap.set({ "n", "v" }, "<leader>ri", ":Refactor inline_var")

vim.keymap.set("n", "<leader>rb", ":Refactor extract_block")
vim.keymap.set("n", "<leader>rbf", ":Refactor extract_block_to_file")

