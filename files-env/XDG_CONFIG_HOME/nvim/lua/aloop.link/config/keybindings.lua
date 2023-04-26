local map = vim.keymap.set

vim.g.mapleader = ' '

-- Undo & Redo
map('n', '<leader>z', ':undo<cr>', { noremap = true })
map('n', '<leader>Z', ':redo<cr>', { noremap = true })

-- Open a vertical split and focus it
map('n', '<leader>v', '<C-w>v<C-w>l', { noremap = true })
-- Open a horizontal split and focus it
map('n', '<leader>V', '<C-w>s<C-w>l', { noremap = true })

-- Easier split navigation
map('n', '<C-h>', '<C-w>h', { noremap = true })
map('n', '<C-j>', '<C-w>j', { noremap = true })
map('n', '<C-k>', '<C-w>k', { noremap = true })
map('n', '<C-l>', '<C-w>l', { noremap = true })

-- Fast window switching
map('n', '<tab>', '<C-w>w', { noremap = true })
map('n', '<S-tab>', '<C-w>W', { noremap = true })

-- Quick navigation through buffers
map('n', '<left>', ':bp<cr>', { noremap = true, silent = true })
map('n', '<right>', ':bn<cr>', { noremap = true, silent = true })
map('n', '<leader>bd', ':bd!<cr>', { noremap = true, silent = true })

-- Clear last search
map('n', '<leader><cr>', ':let @/=""<cr>', { noremap = true, silent = true })
map('n', '/', ':let @/=""<cr>/', { noremap = true })

-- Skip past wrapped lines
map('n', 'j', 'gj', { noremap = true })
map('n', 'k', 'gk', { noremap = true })

-- Select entire buffer
map('n', '<leader>a', 'ggVG', { noremap = true })

-- Center search result when moving through results
map('n', 'n', 'nzzzv', { noremap = true })
map('n', 'N', 'Nzzzv', { noremap = true })

-- Swap lines around like Sublime and VS Code
map('n', '<M-j>', 'mz:m+<cr>`z', { noremap = true })
map('n', '<M-k>', 'mz:m-2<cr>`z', { noremap = true })
map('v', '<M-j>', ':m\'>+<cr>`<mt1>mzgv`yo`z', { noremap = true })
map('v', '<M-k>', ':m\'<-2<cr>`>my`<mzgv`yo`z', { noremap = true })

-- Save a file using sudo
map('c', 'w!!', 'w !sudo tee % >/dev/null', { noremap = true })

-- nvim-tree
map('n', '<C-n>', ':NvimTreeToggle<cr>', { noremap = true, silent = true })

-- telescope
local tsbuiltin = require('telescope.builtin')
map('n', '<C-p>',      tsbuiltin.find_files, {})
map('n', '<leader>ff', tsbuiltin.find_files, {})
map('n', '<leader>fi', tsbuiltin.git_files,  {})
map('n', '<leader>fo', tsbuiltin.oldfiles,   {})
map('n', '<leader>fg', tsbuiltin.live_grep,  {})
map('n', '<leader>fb', tsbuiltin.buffers,    {})
map('n', '<leader>fh', tsbuiltin.help_tags,  {})
