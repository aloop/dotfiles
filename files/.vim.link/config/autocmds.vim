augroup myautocmds
    autocmd!

    " Automatically resize split views when vim is resized
    autocmd VimResized * exe "normal! \<c-w>="

    " Return to last edit position when opening files
    " from http://amix.dk/vim/vimrc.html
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   exe "normal! g`\"" |
                \ endif

    " Recognize .md files as Markdown
    autocmd BufNewFile,BufRead *.md set filetype=markdown
augroup END

