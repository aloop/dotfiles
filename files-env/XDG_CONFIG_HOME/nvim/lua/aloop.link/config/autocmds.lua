augroup = vim.api.nvim_create_augroup
autocmd = vim.api.nvim_create_autocmd

local misc = augroup("@aloop/dotfiles/misc", { clear = true })
local fmt = augroup("@aloop/dotfiles/fmt", { clear = true })

-- go to last cursor location when opening a buffer
autocmd("BufReadPost", {
    command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]],
    group = misc
})

-- Highlight on yank
autocmd("TextYankPost", {
    command = "silent! lua vim.highlight.on_yank({timeout=250})",
    group = misc
})

-- Use OSCYank to copy yanked text to the system clipboard
autocmd("TextYankPost", {
    command = [[if v:event.operator is 'y' && v:event.regname is '' | execute 'OSCYankRegister "' | endif]],
    group = misc
})

autocmd("BufWritePre", {
    command = [[undojoin | Neoformat]],
    group = fmt
})
