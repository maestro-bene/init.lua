return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local keymap = vim.keymap -- for conciseness
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		keymap.set("n", "<leader>hm", mark.add_file, { desc = "Mark file with harpoon" })
		keymap.set(
			"n",
			"<leader>hn",
			"<cmd>lua require('harpoon.ui').nav_next()<cr>",
			{ desc = "Go to next harpoon mark" }
		)
		keymap.set(
			"n",
			"<leader>hp",
			"<cmd>lua require('harpoon.ui').nav_prev()<cr>",
			{ desc = "Go to previous harpoon mark" }
		)
		keymap.set("n", "<leader>hl", ui.toggle_quick_menu, { desc = "List Harpoon entries" })
		keymap.set("n", "<leader>j", function()
			ui.nav_file(1)
		end, { desc = "Follow Harpoon 1" })
		keymap.set("n", "<leader>k", function()
			ui.nav_file(2)
		end, { desc = "Follow Harpoon 2" })
		keymap.set("n", "<leader>l", function()
			ui.nav_file(3)
		end, { desc = "Follow Harpoon 3" })
		keymap.set("n", "<leader>m", function()
			ui.nav_file(4)
		end, { desc = "Follow Harpoon 4" })
	end,
}
