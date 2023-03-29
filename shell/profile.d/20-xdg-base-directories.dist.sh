# shellcheck shell=bash

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
