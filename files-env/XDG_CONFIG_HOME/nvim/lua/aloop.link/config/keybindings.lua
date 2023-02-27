local map = vim.keymap.set

vim.g.mapleader = ','

vim.opt.pastetoggle = '<F2>'

-- Jump by three lines instead of one
map('n', '<C-e>', '3<C-e>')
map('n', '<C-y>', '3<C-y>')

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

-- Toggle highlighting
map('n', '<leader><cr>', ':nohl!<cr>')

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

-- FZF bindings

--- Current file directory
map('n', '<leader>p', ':FZF <c-r>=fnameescape(expand(\'%:p:h\'))<cr>/<cr>')
map('n', '<C-p>', ':FZF <c-r>=fnameescape(expand(\'%:p:h\'))<cr>/<cr>')

--- Current working directory
map('n', '<leader>P', ':FZF<cr>')
map('n', '<leader><tab>', ':Buffers<cr>')
map('n', '<leader>', ':Buffers<cr>')
map('n', '<leader>fl', ':Lines<cr>')
map('n', '<leader>fb', ':BLines<cr>')
map('n', '<leader>fr', ':History<cr>')
map('n', '<leader>f:', ':History:<cr>')
map('n', '<leader>f/', ':History/<cr>')
map('n', '<leader>fg', ':GFiles<cr>')
map('n', '<leader>fs', ':GFiles?<cr>')
map('n', '<leader>fc', ':Commits<cr>')
map('n', '<leader><space>', ':Commands<cr>')

-- Save a file using sudo
map('c', 'w!!', 'w !sudo tee % >/dev/null')

-- nvim-tree
map('n', '<C-n>', ':NvimTreeToggle<cr>')
map('n', '<leader>f', ':NvimTreeRefresh<cr>')
map('n', '<leader>n', ':NvimTreeFindFile<cr>')
