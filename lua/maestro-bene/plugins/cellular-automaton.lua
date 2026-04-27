return {
	"eandrju/cellular-automaton.nvim",
	lazy = "true",
	cmd = "CellularAutomaton",
	vim.keymap.set("n", "<leader>ftl", "<cmd>CellularAutomaton scramble<CR>"),
}
