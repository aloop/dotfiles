if !has('gui_running')
    set t_Co=256
endif

set background=dark

silent! colorscheme dracula

highlight Normal ctermfg=231 ctermbg=233 cterm=none
highlight CursorLine ctermbg=234 cterm=none
highlight ColorColumn ctermbg=234 cterm=none
