require("config.lazy")
require("config.keymaps")
require("config.options")
vim.cmd([[
  highlight MiniStatuslineModeNormal gui=NONE cterm=NONE
  highlight MiniStatuslineModeInsert gui=NONE cterm=NONE
  highlight MiniStatuslineModeVisual gui=NONE cterm=NONE
  highlight MiniStatuslineModeTerminal gui=NONE cterm=NONE
  highlight MiniStatuslineModeCommand gui=NONE cterm=NONE
]])
vim.api.nvim_create_autocmd('FileType', {
    pattern = { '<filetype>' },
    callback = function() vim.treesitter.start() end,
})
vim.opt.guicursor = "n-v-c-i:block-blinkwait175-blinkoff150-blinkon175"
