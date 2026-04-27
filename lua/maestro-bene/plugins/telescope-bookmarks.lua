return {
	"dhruvmanila/browser-bookmarks.nvim",
	lazy = true,
	version = "*",
	-- Only required to override the default options
	opts = {
		-- Override default configuration values
		selected_browser = "safari",
	},
	dependencies = {
		-- Only if you're using the Telescope extension
		"nvim-telescope/telescope.nvim",
	},
}
