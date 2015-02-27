. $HOME/.shellconfig/profile

# Automatically install zgen if it doesn't exist
if [ ! -d "${HOME}/.zgen" ]; then
    df_install_zsh
fi

# Load zgen
if [ -f "${HOME}/.zgen/zgen.zsh" ]; then
    . "${HOME}/.zgen/zgen.zsh"

    # Make sure we haven't already installed
    if ! zgen saved; then
        echo "Installing zgen plugins"

        zgen oh-my-zsh

        # plugins
        zgen oh-my-zsh plugins/git
        zgen oh-my-zsh plugins/sudo
        zgen load zsh-users/zsh-syntax-highlighting

        # completions
        zgen load zsh-users/zsh-completions src

        # theme
        zgen oh-my-zsh themes/afowler

        # Allow a user to declare plugins for an individual install
        [ -f "${HOME}/.zgen.local" ] && . "${HOME}/.zgen.local"

        zgen save

        echo "Finished installing zgen plugins"
    fi
fi
