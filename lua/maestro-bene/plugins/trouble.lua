return {
	"folke/trouble.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		vim.keymap.set("n", "<leader>xx", function()
			require("trouble").open()
		end, { desc = "Trouble" })
		vim.keymap.set("n", "<leader>xw", function()
			require("trouble").open("workspace_diagnostics")
		end, { desc = "Workspace diagnostics" })
		vim.keymap.set("n", "<leader>xd", function()
			require("trouble").open("document_diagnostics")
		end, { desc = "Document diagnostics" })
		vim.keymap.set(
			"n",
			"<leader>xq",
			"<cmd>TroubleToggle quickfix<cr>",
			{ desc = "Trouble quickfix", silent = true, noremap = true }
		)
		vim.keymap.set("n", "<leader>xl", function()
			require("trouble").open("loclist")
		end, { desc = "Trouble loclist" })
	end,
}
