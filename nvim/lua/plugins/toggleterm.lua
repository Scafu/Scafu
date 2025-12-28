return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {
        -- 1. Dimensione: quanto deve essere alto il terminale (es. 15 righe)
        size = 15,
        
        -- 2. Tasto rapido per aprire/chiudere (Toggle)
        -- Qui impostiamo "Ctrl + \" (che è lo standard)
        open_mapping = [[<C-\>]],

        -- 3. Aspetto: rimuovi i numeri di riga nel terminale per pulizia
        hide_numbers = true,
        
        -- 4. Direzione: 'horizontal' lo mette SOTTO (come vuoi tu)
        -- Altre opzioni: 'vertical', 'float' (fluttuante al centro)
        direction = 'horizontal',

        -- 5. Chiudi automaticamente se il terminale finisce il processo
        close_on_exit = true,
    }
  }
}
