return {
	"tpope/vim-fugitive",
	lazy = true,
	keys = "<leader>gs",
	config = function()
		--vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git status" })
		vim.keymap.set("n", "<leader>gs", function()
			vim.cmd("G")
			vim.cmd("wincmd J") -- place la fenêtre courante en bas
			vim.cmd("resize 25") -- hauteur 12 lignes
		end, { silent = true, desc = "Fugitive in small bottom split" })
		local grp = vim.api.nvim_create_augroup("maestro_b_Fugitive", { clear = true })

		local autocmd = vim.api.nvim_create_autocmd
		autocmd("BufWinEnter", {
			group = grp,
			pattern = "*",
			callback = function()
				if vim.bo.ft ~= "fugitive" then
					return
				end

				local bufnr = vim.api.nvim_get_current_buf()
				vim.keymap.set("n", "<leader>p", function()
					vim.cmd.Git("push")
				end, { buffer = bufnr, remap = false, desc = "Git push" })

				-- rebase always
				vim.keymap.set("n", "<leader>P", function()
					vim.cmd.Git("pull --rebase")
				end, { buffer = bufnr, remap = false, desc = "Git pull --rebase" })

				-- NOTE: It allows me to easily set the branch i am pushing and any tracking
				-- needed if i did not set the branch up correctly
				vim.keymap.set("n", "<leader>gp", function()
					local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD")
					branch = string.gsub(branch, "[%s\n]+", "")
					vim.cmd.Git("push --set-upstream origin " .. branch)
				end, { buffer = bufnr, remap = false, desc = "Git push -u origin branch" })
			end,
		})
	end,
}
