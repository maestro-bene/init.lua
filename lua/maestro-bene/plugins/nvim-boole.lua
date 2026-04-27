return {
	"nat-418/boole.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("boole").setup({
			mappings = {
				increment = "<leader>ic",
				decrement = "<leader>id",
			},
			-- User defined loops
			additions = {
				{ "foo", "bar" },
				{ "tic", "tac", "toe" },
			},
			allow_caps_additions = {
				{ "enable", "disable" },
				-- enable → disable
				-- Enable → Disable
				-- ENABLE → DISABLE
			},
		})
	end,
}
