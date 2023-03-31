-- Recommended by nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Setup base settings
require('aloop.bootstrap')

-- Setup all other settings
require('aloop.config.colors')
require('aloop.config.autocmds')
require('aloop.config.keybindings')
require('aloop.config.plugins')

