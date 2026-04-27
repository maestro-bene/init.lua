return {
	"stevearc/oil.nvim",
	opts = {},
	dependencies = { "nvim-tree/nvim-web-devicons", "benomahony/oil-git.nvim" },
	lazy = false,
	vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "go to current buffer's parent directory" }),

	config = function()
		local detail = false
		require("oil").setup({
			keymaps = {
				["gd"] = {
					desc = "Toggle file detail view",
					callback = function()
						detail = not detail
						if detail then
							require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
						else
							require("oil").set_columns({ "icon" })
						end
					end,
				},
			},
		})

		local function get_oil_dir_for_statusline()
			local bufnr = vim.api.nvim_get_current_buf()
			local dir = require("oil").get_current_dir(bufnr)
			if dir then
				return vim.fn.fnamemodify(dir, ":~")
			else
				return vim.api.nvim_buf_get_name(0)
			end
		end

		require("lualine").setup({
			sections = {
				lualine_c = {
					get_oil_dir_for_statusline,
				},
			},
		})
	end,
}
