if !executable('git')
    echom 'WARNING: Git not found. Please install git and re-open vim to use your plugins'
elseif !executable('wget') && !executable('curl')
    echom 'WARNING: Neither wget or curl are available for initializing plugins'
else
    let s:plugins_initial_install = 0
    if !filereadable(vim_dir . '/autoload/plug.vim')
        if executable('curl')
            silent execute printf('!curl --create-dirs -fLo %s https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim', shellescape(vim_dir . '/autoload/plug.vim', 1))
        elseif executable('wget')
            call mkdir(vim_dir . '/autoload', 'p')
            silent execute printf('!wget -qO %s https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim', shellescape(vim_dir . '/autoload/plug.vim', 1))
        endif
        let s:plugins_initial_install = 1
    endif

    if !isdirectory(plugins_dir)
        call mkdir(plugins_dir, 'p')
    endif

    " vim-plug setup {{{

    call plug#begin(plugins_dir)

    " Language Syntaxes
    Plug 'pangloss/vim-javascript'
    Plug 'leafgarland/typescript-vim'
    Plug 'preservim/vim-markdown'
    Plug 'rust-lang/rust.vim'

    " Linting, Autocomplete, and Formatting
    Plug 'editorconfig/editorconfig-vim'
    Plug 'dense-analysis/ale'

    " Git
    Plug 'tpope/vim-fugitive'
    Plug 'mhinz/vim-signify'

    " Color Schemes
    "Plug 'dracula/vim', {'as': 'dracula'}
    Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

    " Clipboard
    Plug 'ojroques/vim-oscyank', {'branch': 'main'}

    " Other Plugins
    Plug 'vim-airline/vim-airline'
    Plug 'tpope/vim-surround'
    Plug 'mattn/emmet-vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    " Define system-specific bundles in the following file.
    " It should contain only plugin definitions.
    runtime local-plugins.vim

    call plug#end()

    if s:plugins_initial_install == 1 && !has('gui_running')
        PlugInstall
    endif

    " End vim-plug Setup }}}
endif

