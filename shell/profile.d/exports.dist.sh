# shellcheck shell=bash

if df_command_exists nvim; then
    export EDITOR="nvim"
    export VISUAL="nvim"
elif df_command_exists vim; then
    export EDITOR="vim"
    export VISUAL="vim"
fi

# Setup the golang path if it isn't already set
export GOPATH=${GOPATH:-"${HOME}/.go"}

export GNUPGHOME="${GNUPGHOME:-"${XDG_CONFIG_HOME}/gnupg"}"

export PAGER="${PAGER:-"less"}"

export LESS="${LESS:-"-CRi -x4"}"

# Enable color in some commands on OSX and some BSDs
export CLICOLOR=1

export XENVIRONMENT="${HOME}/.Xresources"

export DOTFILES_ZSH_CACHE_DIR="${XDG_CACHE_HOME}/zsh"

export ELECTRON_TRASH=trash-cli
export WLC_REPEAT_RATE=50
export WLC_REPEAT_DELAY=250
export MOZ_ENABLE_WAYLAND=1
export QT_QPA_PLATFORM="wayland;xcb"

# set COLORTERM=truecolor if using Windows Terminal
if [ -n "$WT_SESSION" ]; then
    export COLORTERM="truecolor"
fi
