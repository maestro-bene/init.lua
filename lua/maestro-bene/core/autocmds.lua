-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Set treesitter highlighting on
-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = { "<filetype>" },
-- 	callback = function()
-- 		vim.treesitter.start()
-- 		vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- 	end,
-- })

-- Set local settings for terminal buffers
-- vim.api.nvim_create_autocmd("TermOpen", {
-- 	group = vim.api.nvim_create_augroup("custom-term-open", {}),
-- 	callback = function()
-- 		vim.opt.set.number = false
-- 		vim.opt.set.relativenumber = false
-- 		vim.opt.set.scrolloff = 0
--
-- 		vim.bo.filetype = "terminal"
-- 	end,
-- })
--
-- Indentation par langage
local two_spaces = {
	"lua",
	"javascript",
	"javascriptreact",
	"typescript",
	"typescriptreact",
	"json",
	"yaml",
	"toml",
	"html",
	"css",
	"scss",
	"markdown",
	"bash",
	"sh",
	"terraform",
	"hcl",
	"ruby",
}

vim.api.nvim_create_autocmd("FileType", {
	pattern = two_spaces,
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.expandtab = true
	end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = { "*tmux.conf" },
	command = "execute 'silent !tmux source <afile> --silent'",
})

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = { "config.fish" },
	command = "execute 'silent !source <afile> --silent'",
})

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = { ".yabairc" },
	command = "!yabai --restart-service",
})

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = { ".skhdrc" },
	command = "!skhd --restart-service",
})

-- vim.api.nvim_create_autocmd({ "BufRead" }, {
-- 	pattern = { "*.conf" },
-- 	callback = function()
-- 		vim.cmd([[set filetype=sh]])
-- 	end,
-- })
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function(args)
		-- args.match = chemin du buffer (peut être "oil:/..."), args.buf = bufnr
		local name = args.match or vim.api.nvim_buf_get_name(args.buf)
		if name:match("^oil:") then
			return
		end

		local dir = vim.fn.fnamemodify(name, ":p:h")
		if dir ~= "" and vim.fn.isdirectory(dir) == 0 then
			vim.fn.mkdir(dir, "p")
		end
	end,
})
