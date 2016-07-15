set foldmethod=syntax
set foldnestmax=10
" Disable folding by default
set foldlevel=99

" Per-Filetype settings {{{
augroup filetype_overrides
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

