return {
	"harrisoncramer/gitlab.nvim",
	lazy = true,
	keys = {
		"glr",
		"gls",
		"glA",
		"glR",
		"glc",
		"glC",
		"glO",
		"glm",
		"gln",
		"gld",
		"glaa",
		"glad",
		"glla",
		"glld",
		"glra",
		"glrd",
		"glp",
		"glo",
		"glM",
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"stevearc/dressing.nvim", -- Recommended but not required. Better UI for pickers.
		"nvim-tree/nvim-web-devicons",
	},
	enabled = true,
	build = function()
		require("gitlab.server").build(true)
	end, -- Builds the Go binary
	config = function()
		local gitlab = require("gitlab")
		-- local gitlab_server = require("gitlab.server")

		gitlab.setup({
			debug = { go_request = false, go_response = false },
			-- For Gitlab server self-hosted with another port : in the .git/config file, under [core], add :
			-- sshCommand = ssh -p <PORT>
			-- and remove in the ssh url the :PORT as such :
			-- 	url = ssh://git@<gitURL>:PORT/namespace/project.git
			-- 	to
			--  url = ssh://git@<gitURL>/namespace/project.git
		})

		vim.keymap.set("n", "glr", gitlab.review, { desc = "Review" })
		vim.keymap.set("n", "gls", gitlab.summary, { desc = "Summary" })
		vim.keymap.set("n", "glA", gitlab.approve, { desc = "Approve" })
		vim.keymap.set("n", "glR", gitlab.revoke, { desc = "Revoke" })
		vim.keymap.set("n", "glc", gitlab.create_comment, { desc = "Create Comment" })
		vim.keymap.set("v", "glc", gitlab.create_multiline_comment, { desc = "Create Multiline Comment" })
		vim.keymap.set("v", "glC", gitlab.create_comment_suggestion, { desc = "Create Comment Suggestion" })
		vim.keymap.set("n", "glO", gitlab.create_mr, { desc = "Create Merge Request" })
		vim.keymap.set(
			"n",
			"glm",
			gitlab.move_to_discussion_tree_from_diagnostic,
			{ desc = "Move to Discussion Tree from Diagnostic" }
		)
		vim.keymap.set("n", "gln", gitlab.create_note, { desc = "Create Note" })
		vim.keymap.set("n", "gld", gitlab.toggle_discussions, { desc = "Toggle Discussions" })
		vim.keymap.set("n", "glaa", gitlab.add_assignee, { desc = "Add Assignee" })
		vim.keymap.set("n", "glad", gitlab.delete_assignee, { desc = "Delete Assignee" })
		vim.keymap.set("n", "glla", gitlab.add_label, { desc = "Add Label" })
		vim.keymap.set("n", "glld", gitlab.delete_label, { desc = "Delete Label" })
		vim.keymap.set("n", "glra", gitlab.add_reviewer, { desc = "Add Reviewer" })
		vim.keymap.set("n", "glrd", gitlab.delete_reviewer, { desc = "Delete Reviewer" })
		vim.keymap.set("n", "glp", gitlab.pipeline, { desc = "Pipeline" })
		vim.keymap.set("n", "glo", gitlab.open_in_browser, { desc = "Open in Browser" })
		vim.keymap.set("n", "glM", gitlab.merge, { desc = "Merge" })
	end,
}
