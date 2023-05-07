# shellcheck shell=bash

# Automatically setup and source a python venv as long as venv is installed
#
# Ubuntu/Debian users will probably need to install a package named similar to python3-venv

if [ -f "${XDG_DATA_HOME}/virtualenvs/dotfiles/bin/activate" ]; then
    . "${XDG_DATA_HOME}/virtualenvs/dotfiles/bin/activate"
else
    if df_command_exists python; then
        mkdir -p "${XDG_DATA_HOME}/virtualenvs"
        if python -m venv --clear -- "${XDG_DATA_HOME}/virtualenvs/dotfiles" &>/dev/null; then
            . "${XDG_DATA_HOME}/virtualenvs/dotfiles/bin/activate"
            # Update pip and install the black formatter by default
            pip install --upgrade pip black
        fi
    fi
fi

