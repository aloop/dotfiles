local map = vim.keymap.set

vim.g.mapleader = ' '

-- Undo & Redo
map('n', '<leader>z', ':undo<cr>')
map('n', '<leader>Z', ':redo<cr>')

-- Open a vertical split and focus it
map('n', '<leader>v', '<C-w>v<C-w>l')

-- Easier split navigation
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Fast window switching
map('n', '<tab>', '<C-w>w')
map('n', '<S-tab>', '<C-w>W')

-- Quick navigation through buffers
map('n', '<left>', ':bp<cr>')
map('n', '<right>', ':bn<cr>')
map('n', '<leader>ls', ':ls<cr>')
map('n', '<leader>bd', ':bd!<cr>')

-- Clear last search
map('n', '<leader><cr>', ':let @/=""<cr>', { silent = true })
map('n', '/', ':let @/=""<cr>/')

-- Skip past wrapped lines
map('n', 'j', 'gj')
map('n', 'k', 'gk')

-- Select entire buffer
map('n', '<leader>a', 'ggVG')

-- Center search result when moving through results
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- Swap lines around like Sublime and VS Code
map('n', '<M-j>', 'mz:m+<cr>`z')
map('n', '<M-k>', 'mz:m-2<cr>`z')
map('v', '<M-j>', ':m\'>+<cr>`<mt1>mzgv`yo`z')
map('v', '<M-k>', ':m\'<-2<cr>`>my`<mzgv`yo`z')

-- Save a file using sudo
map('c', 'w!!', 'w !sudo tee % >/dev/null')

-- nvim-tree
map('n', '<C-n>', ':NvimTreeToggle<cr>')

-- telescope
local tsbuiltin = require('telescope.builtin')
map('n', '<C-p>',      tsbuiltin.find_files, {})
map('n', '<leader>ff', tsbuiltin.find_files, {})
map('n', '<leader>fi', tsbuiltin.git_files,  {})
map('n', '<leader>fo', tsbuiltin.oldfiles,   {})
map('n', '<leader>fg', tsbuiltin.live_grep,  {})
map('n', '<leader>fb', tsbuiltin.buffers,    {})
map('n', '<leader>fh', tsbuiltin.help_tags,  {})
