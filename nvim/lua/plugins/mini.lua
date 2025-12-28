return {

    {
        'nvim-mini/mini.nvim',
        version = false,
        config = function()
            require("mini.pairs").setup()
            require("mini.statusline").setup()
            require("mini.icons").setup()
            require("mini.git").setup()
            require("mini.diff").setup()
            require("mini.files").setup({
                windows = {
                    preview = true,
                    width_focus = 30,
                    width_preview = 80,
                },
            })
            require("mini.deps").setup()
            require("mini.clue").setup({
                triggers = {
                    { mode = 'n', keys = '<leader>' },
                    { mode = 'x', keys = '<leader>' },
                }
            })
            require("mini.starter").setup()
            require("mini.colors").setup()
            require("mini.indentscope").setup()
        end
    }
}
