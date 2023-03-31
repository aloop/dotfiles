local custom_augroup = vim.api.nvim_create_augroup("@aloop/dotfiles", { clear = true })

-- go to last cursor location when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
    command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]],
    group = custom_augroup
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    command = "silent! lua vim.highlight.on_yank({timeout=250})",
    group = custom_augroup
})

-- Use OSCYank to copy yanked text to the system clipboard
vim.api.nvim_create_autocmd("TextYankPost", {
    command = [[if v:event.operator is 'y' && v:event.regname is '' | execute 'OSCYankRegister "' | endif]],
    group = custom_augroup
})

