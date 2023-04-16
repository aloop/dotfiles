local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    { 'gpanders/editorconfig.nvim', cond = vim.fn.has('nvim-0.9') == 0 },
    { 'catppuccin/nvim', name = 'catppuccin' },
    { 'ojroques/vim-oscyank', branch = 'main' },
    'dense-analysis/ale',
    'tpope/vim-fugitive',
    'mhinz/vim-signify',
    'nvim-tree/nvim-web-devicons',
    {
        'nvim-lualine/lualine.nvim',
        cond = vim.fn.has('nvim-0.5') == 1
    },
    'tpope/vim-surround',
    'mattn/emmet-vim',
    {
        'nvim-treesitter/nvim-treesitter',
        build = function()
            require('nvim-treesitter.install').update({ with_sync = true })
        end,
    },
    { 'nvim-tree/nvim-tree.lua', tag = 'nightly' },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        dependencies = { 'nvim-lua/plenary.nvim' },
        cond = vim.fn.has('nvim-0.7') == 1
    },
    {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            })
        end,
        cond = vim.fn.has('nvim-0.5') == 1
    },
})
