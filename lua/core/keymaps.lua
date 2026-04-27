-- To see/edit the <leader>, see ./general.lua

local keymap = vim.keymap -- for conciseness

-- GENERAL KEYMAPS

keymap.set("n", "<leader>q", ":q<CR>", { desc = "Exit buffer" })
keymap.set("n", "<leader>sq", ":wq<CR>", { desc = "Write and Exit buffer" })
keymap.set("n", "<Esc>", ":q<CR>", { desc = "Exit buffer" })
keymap.set("n", "!<Esc>", ":q!<CR>", { desc = "Exit buffer w/o saving" })

keymap.set("n", "<leader><leader>", ":w<CR>", { desc = "Save buffer" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "x", '"_x', { desc = "Deleting single char whitout copying into reg" })

-- Move around selected text up and down
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Append the line below to current line
keymap.set("n", "<leader>j", "mzJ`z")

-- Centering the cursor when moving up/down half a bufr
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "G", "Gzz")

-- Centering the cursor when iterating over search results
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- Greatest remap ever
keymap.set("v", "<leader>y", [["+y]], { desc = "Copy into system clipboard" })
keymap.set("n", "<leader>y", ":%y+<CR>", { desc = "Copy whole file into system clipboard" })

-- quickfix list commands
keymap.set("n", "<C-k>", ":cnext<CR>zz")
keymap.set("n", "<C-j>", ":cprev<CR>zz")
--keymap.set("n", "<leader>qk", ":lnext<CR>zz")
--keymap.set("n", "<leader>qj", ":lprev<CR>zz")

keymap.set("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word (file)" })
keymap.set("n", "<leader>vc", ":e ~/.config/nvim/<CR>", { desc = "Access nvim config" })

-- Window Management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })

keymap.set("n", "<c-j>", "<c-w><c-j>")
keymap.set("n", "<c-k>", "<c-w><c-k>")
keymap.set("n", "<c-l>", "<c-w><c-l>")
keymap.set("n", "<c-h>", "<c-w><c-h>")

keymap.set(
  "n",
  "<C-Right>",
  ":vertical resize +5<CR>",
  { noremap = true, silent = true, desc = "Add 5 width to current window" }
)
keymap.set(
  "n",
  "<C-Left>",
  ":vertical resize -5<CR>",
  { noremap = true, silent = true, desc = "Remove 5 width to current window" }
)
keymap.set("n", "<C-Up>", ":resize +5<CR>", { noremap = true, silent = true, desc = "Add 5 height to current window" })
keymap.set(
  "n",
  "<C-Down>",
  ":resize -5<CR>",
  { noremap = true, silent = true, desc = "Remove 5 height to current window" }
)

-- Easily hit escape in terminal mode.
keymap.set("t", "<esc><esc>", "<c-\\><c-n>")
