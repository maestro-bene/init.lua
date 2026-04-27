return {
	"nvim-neorg/neorg",
	lazy = true, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
	version = "*", -- Pin Neorg to the latest stable release
	config = {
		load = {
			["core.defaults"] = {},
			["external.interim-ls"] = {},
			["core.completion"] = {
				config = { engine = { module_name = "external.lsp-completion" } },
			},
			["core.concealer"] = {},
			["core.dirman"] = {},
			["core.export"] = {},
			["core.export.markdown"] = {
				config = {
					extensions = "all",
				},
			},
			["core.presenter"] = {
				config = { zen_mode = "zen-mode" },
			},
			["core.text-objects"] = {},
		},
	},
}
