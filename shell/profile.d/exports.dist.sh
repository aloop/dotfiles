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

# Setup defaults for XDG
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-"${HOME}/.config"}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-"${HOME}/.cache"}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-"${HOME}/.local/state"}"
export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-"${HOME}/.run"}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-"${HOME}/.local/share"}"

# Add snapd dir to XDG_DATA_DIRS
if [ "${XDG_DATA_DIRS#*/snapd/desktop}" = "${XDG_DATA_DIRS}" ]; then
    export XDG_DATA_DIRS="${XDG_DATA_DIRS:-/usr/local/share:/usr/share}:/var/lib/snapd/desktop"
fi

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

