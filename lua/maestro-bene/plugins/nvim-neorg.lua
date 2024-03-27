return {
	"nvim-neorg/neorg",
	ft = "norg",
	-- build = ":Neorg sync-parsers",
	dependencies = { { "nvim-lua/plenary.nvim" }, { "nvim-neorg/neorg-telescope" } },
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {}, -- Loads default behaviour
				["core.concealer"] = {}, -- Adds pretty icons to your documents
				["core.integrations.telescope"] = {},
				["core.export.markdown"] = {}, -- Adds possibility to export notes in markdown
				["core.dirman"] = { -- Manages Neorg workspaces
					config = {
						workspaces = {
							notes = "~/notes",
						},
					},
				},
			},
		})
	end,
}
