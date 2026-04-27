-- To see/edit the <leader>, see ./general.lua

local keymap = vim.keymap -- for conciseness

-- GENERAL KEYMAPS

keymap.set("n", "<leader>q", "<CMD>q<CR>", { desc = "Exit buffer" })
keymap.set("n", "<leader>sq", "<CMD>wq<CR>", { desc = "Write and Exit buffer" })
keymap.set("n", "<Esc>", "<CMD>q<CR>", { desc = "Exit buffer" })
keymap.set("n", "!<Esc>", "<CMD>q!<CR>", { desc = "Exit buffer w/o saving" })

keymap.set("n", "<leader>x", "<CMD>.lua<CR>", { desc = "Execute the current line" })
keymap.set("n", "<leader>X", "<CMD>source %<CR>", { desc = "Execute the current file" })

keymap.set("n", "<leader><leader>", "<CMD>w<CR>", { desc = "Save buffer" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "x", '"_x', { desc = "Deleting single char whitout copying into reg" })

-- Move around selected text up and down
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Append the line below to current line
keymap.set("n", "J", "mzJ`z")

-- Centering the cursor when moving up/down half a bufr
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "G", "Gzz")

-- Centering the cursor when iterating over search results
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- Greatest remap ever
keymap.set("x", "<leader>pe", [["_dP]], { desc = "Seems to be git push" })

-- next greatest remap ever : asbjornHaland
keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy into system clipboard" })
keymap.set("n", "<leader>Y", [["+Y]])

-- quickfix list commands
keymap.set("n", "<C-k>", "<CMD>cnext<CR>zz")
keymap.set("n", "<C-j>", "<CMD>cprev<CR>zz")
--keymap.set("n", "<leader>qk", "<CMD>lnext<CR>zz")
--keymap.set("n", "<leader>qj", "<CMD>lprev<CR>zz")

keymap.set("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word (file)" })
keymap.set("n", "<leader>vc", "<CMD>e ~/.config/nvim/<CR>", { desc = "Access nvim config" })

-- Window Management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })

keymap.set("n", "<c-j>", "<c-w><c-j>")
keymap.set("n", "<c-k>", "<c-w><c-k>")
keymap.set("n", "<c-l>", "<c-w><c-l>")
keymap.set("n", "<c-h>", "<c-w><c-h>")

keymap.set("n", "<leader>to", "<CMD>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tq", "<CMD>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<CMD>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<CMD>tabp<CR>", { desc = "Go to previous tab" })

keymap.set("n", "<leader>tf", "<CMD>tabnew %<CR>", { desc = "Open current buffer in new tab" })


-- Easily hit escape in terminal mode.
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")


keymap.set("n", "j", function()
    local count = vim.v.count

    if count == 0 then
        return "gj"
    else
        return "j"
    end
end, { expr = true })

keymap.set("n", "k", function()
    local count = vim.v.count

    if count == 0 then
        return "gk"
    else
        return "k"
    end
end, { expr = true })
