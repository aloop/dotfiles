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
    Plug 'othree/html5.vim'
    Plug 'pangloss/vim-javascript'
    Plug 'plasticboy/vim-markdown'
    Plug 'evidens/vim-twig'

    " Linting and Auto-complete
    Plug 'scrooloose/syntastic'

    " Color Schemes
    Plug 'flazz/vim-colorschemes'
    Plug 'chriskempson/base16-vim'

    " Other Plugins
    Plug 'bling/vim-airline'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'kien/ctrlp.vim'
    Plug 'mattn/emmet-vim'

    " Define system-specific bundles in the following file.
    " It should contain only plugin definitions.
    runtime local-plugins.vim

    call plug#end()

    if s:plugins_initial_install == 1 && !has('gui_running')
        PlugInstall
    endif

    " End vim-plug Setup }}}
endif

