return {
    {
        "stevearc/conform.nvim",
        event = { "BufReadPre", "BufNewFile", "BufWritePre" },
        config = function()
            local conform = require("conform")

            conform.setup({
                -- 1. Definiamo quali formattatori usare per ogni linguaggio
                formatters_by_ft = {
                    lua = { "stylua" },
                    typst = { "typstyle" }, -- Richiede di installare 'typstyle' (vedi sotto)
                    python = { "isort", "black" },
                    javascript = { "prettier" },
                    typescript = { "prettier" },
                    css = { "prettier" },
                    html = { "prettier" },
                    json = { "prettier" },

                },

                -- 2. Configurazione "Format on Save" (Formatta quando salvi)
                format_on_save = {
                    lsp_fallback = true, -- Se non trova un tool, usa quello dell'LSP (backup)
                    async = false,       -- Blocca un attimo l'editor finché non finisce (più sicuro)
                    timeout_ms = 1000,   -- Tempo massimo di attesa
                },
            })

            -- 3. Tasto rapido per formattare MANUALMENTE: Spazio + f
            vim.keymap.set({ "n", "v" }, "<leader>f", function()
                conform.format({
                    lsp_fallback = true,
                    async = true,
                    timeout_ms = 1000,
                })
            end, { desc = "Formatta file o selezione" })
        end,
    }

}
