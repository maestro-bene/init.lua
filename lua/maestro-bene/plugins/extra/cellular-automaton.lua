return {
	"eandrju/cellular-automaton.nvim",
	lazy = true,
	cmd = "CellularAutomaton",
	vim.keymap.set("n", "<leader>fl", "<cmd>CellularAutomaton scramble<CR>"),
}
