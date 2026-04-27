return {
	"tpope/vim-dadbod",
	opt = true,
	requires = {
		"kristijanhusak/vim-dadbod-ui",
		"kristijanhusak/vim-dadbod-completion",
	},
	config = function()
		require("config.dadbod").setup()
	end,
}
