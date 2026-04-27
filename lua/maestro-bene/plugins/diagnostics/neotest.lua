return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "rcasia/neotest-bash",
    "olimorris/neotest-phpunit",
    "nvim-neotest/neotest-python",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-bash"),
        require("neotest-phpunit"),
        require("neotest-python"),
      },
    })
    -- Keymaps Neotest - préfixe <leader>t (une seule ligne chacun, pas de fonctions locales)
    vim.keymap.set("n", "<leader>tn", function() require("neotest").run.run() end, { desc = "Neotest: run nearest" })
    vim.keymap.set("n", "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end,
      { desc = "Neotest: run file" })
    vim.keymap.set("n", "<leader>td", function() require("neotest").run.run({ strategy = "dap" }) end,
      { desc = "Neotest: debug nearest (DAP)" })
    vim.keymap.set("n", "<leader>ts", function() require("neotest").run.stop() end, { desc = "Neotest: stop nearest" })
    vim.keymap.set("n", "<leader>ta", function() require("neotest").run.attach() end,
      { desc = "Neotest: attach nearest" })
  end,
}
