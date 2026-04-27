return {
  {
    "francescarpi/buffon.nvim",
    branch = "main",
    ---@type BuffonConfig
    opts = {
      open = {
        by_default = false,
        default_position = "bottom_right"
      }
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-lua/plenary.nvim",
    },
  },
}
