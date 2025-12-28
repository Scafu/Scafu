return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require('tokyonight').setup({
                transparent = true,
                style = "night",
                on_highlights = function(hl)
                    hl.Statement = { fg = "#ff9e64" }
                end
            })
            vim.cmd.colorscheme "tokyonight-night"
        end
    },

}
