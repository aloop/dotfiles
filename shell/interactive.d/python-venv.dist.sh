# shellcheck shell=bash

# Automatically setup and source a python venv as long as venv is installed
#
# Ubuntu/Debian users will probably need to install a package named similar to python3-venv

if [ -f "${XDG_DATA_HOME}/virtualenvs/dotfiles/bin/activate" ]; then
    . "${XDG_DATA_HOME}/virtualenvs/dotfiles/bin/activate"
else
    if df_command_exists python3; then
        mkdir -p "${XDG_DATA_HOME}/virtualenvs"
        if python3 -m venv --clear -- "${XDG_DATA_HOME}/virtualenvs/dotfiles" &>/dev/null; then
            . "${XDG_DATA_HOME}/virtualenvs/dotfiles/bin/activate" && \
            pip3 install --upgrade pip black
        fi
    fi
fi
