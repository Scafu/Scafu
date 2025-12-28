-- ==========================================
-- DIAGNOSTIC
-- ==========================================
vim.opt.updatetime = 250

local function show_diagnostic_hover()
    local bufnr = vim.api.nvim_get_current_buf()

    if #vim.diagnostic.get(bufnr) > 0 then
        vim.diagnostic.open_float({ source = true })
    end
end

vim.api.nvim_create_autocmd('CursorHold', {
    group = vim.api.nvim_create_augroup('LspDiagnosticHover', { clear = true }),
    pattern = { '*' },
    callback = show_diagnostic_hover,
})

-- ==========================================
-- FILE ROW MANAGEMENT
-- ==========================================

vim.keymap.set({ 'n', 'v', 's' }, '<C-s>', '<cmd>w<cr>', { desc = 'Salva File' })
-- ==========================================
-- SPLIT SCREEN MANAGEMENT (ARROW KEYS)
-- ==========================================

-- Use Leader + s + v/h
vim.keymap.set('n', '<leader>sv', '<cmd>vsplit<cr>', { desc = 'Vertical Split |' })
vim.keymap.set('n', '<leader>sh', '<cmd>split<cr>', { desc = 'Horizontal Split -' })

-- Use Leader + w + q
vim.keymap.set('n', '<leader>wq', '<cmd>wq<cr>', { desc = 'Close Current Windows and Save' })

-- Use CTRL + Arrow Keys
vim.keymap.set('n', '<C-Left>', '<C-w>h', { desc = 'Go to Left Window' })
vim.keymap.set('n', '<C-Down>', '<C-w>j', { desc = 'Go to Bottom Window' })
vim.keymap.set('n', '<C-Up>', '<C-w>k', { desc = 'Go to Top Window' })
vim.keymap.set('n', '<C-Right>', '<C-w>l', { desc = 'Go to Right Window' })

-- Use ALT + Arrow Keys
vim.keymap.set('n', '<M-Left>', '<cmd>vertical resize +2<cr>', { desc = 'Decrease Width' })
vim.keymap.set('n', '<M-Right>', '<cmd>vertical resize -2<cr>', { desc = 'Increase Width' })
vim.keymap.set('n', '<M-Up>', '<cmd>resize +2<cr>', { desc = 'Increase Height' })
vim.keymap.set('n', '<M-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease Height' })

-- Use Leader + s + Down)
vim.keymap.set('n', '<leader>s<Down>', '<cmd>call append(line("."), "")<cr>', { desc = 'Add empty line below' })

-- Use Leader + s + Up
vim.keymap.set('n', '<leader>s<Up>', '<cmd>call append(line(".")-1, "")<cr>', { desc = 'Add empty line above' })

-- ==========================================
-- TELESCOPE
-- ==========================================
vim.keymap.set("n", "<leader>ff", "<cmd>lua require('telescope.builtin').fin<cr>", { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", "<cmd>Tel<cr>", { desc = "Live Grep" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help Tags" })
vim.api.nvim_create_autocmd("User", {
    pattern = "MiniFilesBufferCreate",
    callback = function(args)
        local MiniFiles = require("mini.files")
        local buf_id = args.data.buf_id
        vim.keymap.set("n", "b", function()
            MiniFiles.go_out()
            MiniFiles.trim_right()
        end, { buffer = buf_id, desc = "Go Back (Directory Up)" })
        vim.keymap.set("n", "<CR>", function()
            MiniFiles.go_in()
        end, { buffer = buf_id, desc = "Go In (Enter Dir/File)" })
        vim.keymap.set("n", "<Up>", "k", { buffer = buf_id })
        vim.keymap.set("n", "<Down>", "j", { buffer = buf_id })
        vim.keymap.set("n", "<Left>", "h", { buffer = buf_id })
        vim.keymap.set("n", "<Right>", "l", { buffer = buf_id })
        local map_split = function(lhs, direction)
            local rhs = function()
                local entry = require("mini.files").get_fs_entry()
                if entry.fs_type == "file" then
                    require("mini.files").close()
                    vim.cmd(direction .. " " .. entry.path)
                end
            end
            vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = "Open in Split" })
        end

        map_split("<leader>sv", "vsplit")
        map_split("<leader>sh", "split")
    end,
})
vim.keymap.set("n", "<leader>e", function()
    if not require("mini.files").close() then require("mini.files").open() end
end, { desc = "Mini Files Explorer" })
