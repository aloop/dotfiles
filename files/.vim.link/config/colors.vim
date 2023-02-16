if !has('gui_running')
    set t_Co=256
endif

set background=dark

silent! colorscheme catppuccin-mocha " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha

highlight Normal ctermfg=231 ctermbg=NONE guibg=NONE cterm=NONE
highlight CursorLine ctermbg=237 cterm=none
highlight ColorColumn ctermbg=237 cterm=none
