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
        zgen oh-my-zsh plugins/gitfast
        zgen oh-my-zsh plugins/sudo
        zgen oh-my-zsh plugins/rsync
        zgen oh-my-zsh plugins/brew
        zgen oh-my-zsh plugins/command-not-found

        # Disable automatic creation of a tmux session while running this setup
        export ZSH_TMUX_AUTOSTART=false
        zgen oh-my-zsh plugins/tmux

        # theme
        zgen oh-my-zsh themes/afowler

        # Allow a user to declare plugins for an individual install
        [ -f "${HOME}/.zgen.local" ] && . "${HOME}/.zgen.local"

        # completions
        zgen load zsh-users/zsh-completions src

        # Should be last
        zgen load zsh-users/zsh-syntax-highlighting

        zgen save

        echo "Finished installing zgen plugins"
    fi
fi
