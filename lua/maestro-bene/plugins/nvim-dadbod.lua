return {
	"tpope/vim-dadbod",
	opt = false,
	requires = {
		"kristijanhusak/vim-dadbod-ui",
		"kristijanhusak/vim-dadbod-completion",
	},
	config = function()
		require("config.dadbod").setup()
	end,
}
