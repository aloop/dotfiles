local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    -- Let Packer manage itself
    use 'wbthomason/packer.nvim'

    -- Language Syntaxes
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end
    }

    -- Linting, Autocomplete, and Formatting
    use 'editorconfig/editorconfig-vim'
    use 'dense-analysis/ale'

    -- Git
    use 'tpope/vim-fugitive'
    use 'mhinz/vim-signify'

    -- Color Schemes
    use {
        'catppuccin/nvim',
        as = 'catppuccin'
    }

    -- Clipboard
    use {
        'ojroques/vim-oscyank',
        branch = 'main'
    }

    -- Other Plugins
    use 'nvim-tree/nvim-web-devicons'
    use {
        'nvim-lualine/lualine.nvim',
        requires = {
            'nvim-tree/nvim-web-devicons',
            opt = true
        }
    }
    use 'tpope/vim-surround'
    use 'mattn/emmet-vim'
    use 'junegunn/fzf.vim'
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons'
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    -- Automatically set up your configuration after cloning packer.nvim
    if packer_bootstrap then
        require('packer').sync()
    end
end)

