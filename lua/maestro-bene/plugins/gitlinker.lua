return {
	"ruifm/gitlinker.nvim",
	lazy = true,
	event = { "BufReadPre" },
	keys = { "<leader>gb", "<leader>gY", "<leader>gB", "<leader>gy" },
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		vim.api.nvim_set_keymap(
			"n",
			"<leader>gb",
			'<cmd>lua require"gitlinker".get_buf_range_url("n", {action_callback = require"gitlinker.actions".open_in_browser})<cr>',
			{ silent = true, desc = "Go to Git URL for this buffer" }
		)
		vim.api.nvim_set_keymap(
			"v",
			"<leader>gb",
			'<cmd>lua require"gitlinker".get_buf_range_url("v", {action_callback = require"gitlinker.actions".open_in_browser})<cr>',
			{ desc = "Go to Git URL for the selection" }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>gY",
			'<cmd>lua require"gitlinker".get_repo_url()<cr>',
			{ silent = true, desc = "Copy Git URL of the repository" }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>gB",
			'<cmd>lua require"gitlinker".get_repo_url({action_callback = require"gitlinker.actions".open_in_browser})<cr>',
			{ silent = true, desc = "Go to Git URL for this repository" }
		)
		require("gitlinker").setup({
			mappings = nil,
		})

		-- Creating this keymap after the setup in order to override default git linker copy line link
		vim.api.nvim_set_keymap(
			"n",
			"<leader>gy",
			'<cmd>lua require"gitlinker".get_buf_range_url()<cr>',
			{ silent = true, desc = "Copy Git URL for this buffer" }
		)
	end,
}
