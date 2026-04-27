return {
	"olimorris/codecompanion.nvim",
	opts = {},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		{
			"MeanderingProgrammer/render-markdown.nvim",
			ft = { "markdown", "codecompanion" },
		},
	},
	config = function()
		require("codecompanion").setup({
			adapters = {
				http = {
					opts = {
						show_defaults = false,
						vision = true,
						stream = true,
						allow_insecure = true,
					},
					ollama = function()
						return require("codecompanion.adapters").extend("ollama", {
							name = "pgpt",
							env = {
								url = "https://hubble.tb.rns.equant.com/ollama",
							},

							headers = {
								["Content-Type"] = "application/json",
								["Authorization"] = "Basic Z2N1ZGVubmVjOkF2ckd+T3Nsb2ErVE1yRSY=",
							},
							parameters = {
								sync = true,
							},
						})
					end,
				},
			},
			strategies = {
				chat = {
					adapter = "ollama",
					model = "mixtral",
				},
				inline = {
					adapter = "ollama",
					model = "mixtral",
				},
				cmd = {
					adapter = "ollama",
					model = "mixtral",
				},
			},
			extensions = {},
			opts = {
				log_level = "ERROR", -- TRACE|DEBUG|ERROR|INFO
				language = "French",
			},
		})
	end,
}
