return {
  {
    'chomosuke/typst-preview.nvim',
    lazy = false,
    version = '1.*',
    build = function() require 'typst-preview'.update() end,
    opts = {
        open_cmd = "powershell.exe -c Start-Process %s",
        invert_colors = 'never',
        follow_cursor = false,

        -- ⬇️ QUESTA È LA SOLUZIONE AL PROBLEMA DEGLI IMPORT ⬇️
        -- Dice al plugin: "La radice del progetto è la cartella dove ho aperto il terminale"
        get_root = function(path_of_main_file)
          return vim.fn.getcwd()
        end,
    }
  }
}
