return {
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
        },
    },
    { 'brenoprata10/nvim-highlight-colors' },

    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            { "williamboman/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "html" },
                handlers = {
                    function(server_name)
                        local capabilities = require('cmp_nvim_lsp').default_capabilities()
                        require("lspconfig")[server_name].setup({
                            capabilities = capabilities
                        })
                    end,
                }
            })
        end
    },

    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
            local cmp = require("cmp")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                }, {
                    { name = 'buffer' }, }),
                formatting = { format = require("nvim-highlight-colors").format }
            })
        end
    },
    {
        'nvim-flutter/flutter-tools.nvim',
        lazy = false,
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            require("flutter-tools").setup({
                ui = {
                    border = "rounded",
                },
                decorations = {
                    statusline = {
                        app_version = true,
                        device_at_host = true,
                    }
                },
                lsp = {
                    capabilities = capabilities,
                    -- Qui puoi inserire le tue configurazioni LSP standard
                    color_render = true,
                    settings = {
                        showTodos = true,
                        completeFunctionCalls = true,
                        analysisExcludedFolders = {
                            vim.fn.expand("$HOME/.pub-cache"),
                            vim.fn.expand("$HOME/develop/flutter"),
                        },
                        updatePackageContents = true,
                    },
                },
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        event = "BufRead",
        branch = "main",
        build = ":TSUpdate",
        ---@class TSConfig
        opts = {
            -- custom handling of parsers
            ensure_installed = {
                "astro",
                "bash",
                "c",
                "css",
                "dart",
                "html",
                "javascript",
                "jsdoc",
                "json",
                "json5",
                "lua",
                "luadoc",
                "luap",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "tsx",
                "typescript",
                "vim",
                "vimdoc",
                "yaml",
                "ruby",
            },
        },
        config = function(_, opts)
            -- install parsers from custom opts.ensure_installed
            if opts.ensure_installed and #opts.ensure_installed > 0 then
                require("nvim-treesitter").install(opts.ensure_installed)
                -- register and start parsers for filetypes
                for _, parser in ipairs(opts.ensure_installed) do
                    local filetypes = parser -- In this case, parser is the filetype/language name
                    vim.treesitter.language.register(parser, filetypes)

                    vim.api.nvim_create_autocmd({ "FileType" }, {
                        pattern = filetypes,
                        callback = function(event)
                            vim.treesitter.start(event.buf, parser)
                        end,
                    })
                end
            end

            -- Auto-install and start parsers for any buffer
            vim.api.nvim_create_autocmd({ "BufRead" }, {
                callback = function(event)
                    local bufnr = event.buf
                    local filetype = vim.api.nvim_get_option_value("filetype", { buf = bufnr })

                    -- Skip if no filetype
                    if filetype == "" then
                        return
                    end

                    -- Check if this filetype is already handled by explicit opts.ensure_installed config
                    for _, filetypes in pairs(opts.ensure_installed) do
                        local ft_table = type(filetypes) == "table" and filetypes or { filetypes }
                        if vim.tbl_contains(ft_table, filetype) then
                            return -- Already handled above
                        end
                    end

                    -- Get parser name based on filetype
                    local parser_name = vim.treesitter.language.get_lang(filetype) -- might return filetype (not helpful)
                    if not parser_name then
                        return
                    end
                    -- Try to get existing parser (helpful check if filetype was returned above)
                    local parser_configs = require("nvim-treesitter.parsers")
                    if not parser_configs[parser_name] then
                        return -- Parser not available, skip silently
                    end

                    local parser_installed = pcall(vim.treesitter.get_parser, bufnr, parser_name)

                    if not parser_installed then
                        -- If not installed, install parser synchronously
                        require("nvim-treesitter").install({ parser_name }):wait(30000)
                    end

                    -- let's check again
                    parser_installed = pcall(vim.treesitter.get_parser, bufnr, parser_name)

                    if parser_installed then
                        -- Start treesitter for this buffer
                        vim.treesitter.start(bufnr, parser_name)
                    end
                end,
            })
        end,
    },

    {
        "pwntester/octo.nvim",
        cmd = "Octo",
        opts = {
            -- or "fzf-lua" or "snacks" or "default"
            picker = "telescope",
            -- bare Octo command opens picker of commands
            enable_builtin = true,
        },
        keys = {
            {
                "<leader>oi",
                "<CMD>Octo issue list<CR>",
                desc = "List GitHub Issues",
            },
            {
                "<leader>op",
                "<CMD>Octo pr list<CR>",
                desc = "List GitHub PullRequests",
            },
            {
                "<leader>od",
                "<CMD>Octo discussion list<CR>",
                desc = "List GitHub Discussions",
            },
            {
                "<leader>on",
                "<CMD>Octo notification list<CR>",
                desc = "List GitHub Notifications",
            },
            {
                "<leader>os",
                function()
                    require("octo.utils").create_base_search_command { include_current_repo = true }
                end,
                desc = "Search GitHub",
            },
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
            "nvim-tree/nvim-web-devicons",
        },


    }
}
