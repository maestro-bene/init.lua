local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

vim.cmd([[command! -nargs=0 GoToCommand :Telescope commands]])
vim.cmd([[command! -nargs=0 GoToFile :Telescope find_files]])
vim.cmd([[command! -nargs=0 Grep :Telescope live_grep]])
vim.cmd([[command! -nargs=0 SmartGoTo :Telescope smart_goto]])
vim.o.cursorlineopt = "number"

require("lazy").setup({
    { import = "maestro-bene.plugins" },
    { import = "maestro-bene.plugins.ai" },
    { import = "maestro-bene.plugins.completion" },
    { import = "maestro-bene.plugins.diagnostics" },
    { import = "maestro-bene.plugins.editing-utils" },
    { import = "maestro-bene.plugins.extra" },
    { import = "maestro-bene.plugins.theme" },
}, {
    checker = {
        enabled = true,
        notify = false,
    },
    change_detection = {
        notify = false,
    },
    ui = { border = "rounded" },
})
