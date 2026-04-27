return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = "master",
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "windwp/nvim-ts-autotag",
    },
    config = function()
      -- import nvim-treesitter plugin
      local treesitter = require("nvim-treesitter.configs")

      -- configure treesitter
      treesitter.setup({
        -- -- Directory to install parsers and queries to
        install_dir = vim.fn.stdpath('data') .. '/site',
        -- enable syntax highlighting
        highlight = {
          enable = true,
          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          additional_vim_regex_highlighting = false,
        },
        sync_install = false,
        auto_install = false,
        ignore_install = {},
        -- enable indentation
        indent = { enable = true },
        -- enable autotagging (w/ nvim-ts-autotag plugin)
        autotag = {
          enable = true,
        },
        -- ensure these language parsers are installed
        ensure_installed = {
          "html",
          "css",
          "javascript",
          "python",
          "java",
          "go",
          "elixir",
          "c",
          "bash",
          "lua",
          "regex",
          "yaml",
          "dockerfile",
          "gitignore",
          "vim",
          "vimdoc",
          "markdown",
          "markdown_inline",
          "json",
          "php",
        },
        modules = {},
        incremental_selection = {
          enable = false,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },
      })
    end,
  },
}
