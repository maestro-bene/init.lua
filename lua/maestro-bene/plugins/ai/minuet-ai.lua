return {
    {
        'milanglacier/minuet-ai.nvim',
        config = function()
            require('minuet').setup {}
        end,
    },
    { 'nvim-lua/plenary.nvim' },
    { 'Saghen/blink.cmp' },
}
