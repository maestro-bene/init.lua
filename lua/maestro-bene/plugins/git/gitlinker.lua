return {
	"linrongbin16/gitlinker.nvim",
	lazy = false,
	cmd = "GitLink",
	opts = {
		router = {
			browse = {
				["^gitlab%.tech%.orange"] = "https://gitlab.tech.orange/"
					.. "{_A.ORG}/"
					.. "{_A.REPO}/blob/"
					.. "{_A.REV}/"
					.. "{_A.FILE}"
					.. "#L{_A.LSTART}"
					.. "{(_A.LEND > _A.LSTART and ('-L' .. _A.LEND) or '')}",
			},
			blame = {
				["^gitlab%.tech%.orange"] = "https://gitlab.com/"
					.. "{_A.ORG}/"
					.. "{_A.REPO}/blame/"
					.. "{_A.REV}/"
					.. "{_A.FILE}"
					.. "#L{_A.LSTART}"
					.. "{(_A.LEND > _A.LSTART and ('-L' .. _A.LEND) or '')}",
			},
		},
	},
	keys = {
		{ "<leader>gy", "<cmd>GitLink<cr>", mode = { "n", "v" }, desc = "Yank git link" },
		{ "<leader>gY", "<cmd>GitLink!<cr>", mode = { "n", "v" }, desc = "Open git link" },
	},
}
