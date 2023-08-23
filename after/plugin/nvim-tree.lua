-- setup to ignore node_modules
require("nvim-tree").setup{
    hijack_cursor = true,
    filters = {
        custom = {"node_modules"},
     }
}
