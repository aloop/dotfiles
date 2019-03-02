if !executable('git')
    echom 'WARNING: Git not found. Please install git and re-open vim to use your Vundle plugins'
elseif !executable('wget') && !executable('curl')
    echom 'WARNING: Neither wget or curl are available for initializing plugins'
else
    let s:plugins_initial_install = 0
    if !filereadable(vim_dir . '/autoload/plug.vim')
        if executable('wget')
            silent execute printf('!mkdir -p %s', shellescape(vim_dir . '/autoload', 1))
            silent execute printf('!wget -qO %s https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim', shellescape(vim_dir . '/autoload/plug.vim', 1))
        elseif executable('curl')
            silent execute printf('!curl --create-dirs -fLo %s https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim', shellescape(vim_dir . '/autoload/plug.vim', 1))
        endif
        let s:plugins_initial_install = 1
    endif

    " vim-plug setup {{{

    call plug#begin(vim_dir . '/plugged')

    " Language Syntaxes
    Plug 'pangloss/vim-javascript'
    Plug 'leafgarland/typescript-vim'
    Plug 'plasticboy/vim-markdown'
    Plug 'evidens/vim-twig'

    " Version Control
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'

    " Linting and Auto-complete
    Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
    Plug 'editorconfig/editorconfig-vim'

    if executable('npm')
        Plug 'prettier/vim-prettier', { 'do': 'npm install' }
    endif

    " Color Schemes
    Plug 'dracula/vim'

    " Other Plugins
    Plug 'bling/vim-airline'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'mattn/emmet-vim'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
    Plug 'junegunn/fzf.vim'

    " Define system-specific bundles in the following file.
    " It should contain only plugin definitions.
    runtime local-plugins.vim

    call plug#end()

    if s:plugins_initial_install == 1 && !has('gui_running')
        PlugInstall
        CocInstall 'coc-tsserver'
        CocInstall 'coc-json'
    endif

    " End vim-plug Setup }}}
endif

