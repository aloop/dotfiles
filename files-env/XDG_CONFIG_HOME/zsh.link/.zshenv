if [ -f "${HOME}/.before" ]; then
    . "${HOME}/.before"
fi

if [ -f "${HOME}/.zshenv.local" ]; then
    . "${HOME}/.zshenv.local"
fi

# If DOTFILES_DIR is set, use it, otherwise default to `$HOME/.dotfiles`
export DOTFILES_DIR="${DOTFILES_DIR:-"$HOME/.dotfiles"}"

. "${DOTFILES_DIR}/shell/profile.sh"

# Set the directory that the other ZSH startup files should be loaded from
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"

# Set plugin install directory
export DOTFILES_ZSH_PLUGINS_DIR="${DOTFILES_ZSH_PLUGINS_DIR:-"${XDG_DATA_HOME}/dotfiles/zsh-plugins"}"

if [ -f "${HOME}/.after" ]; then
    . "${HOME}/.after"
fi

