# If DOTFILES_DIR is set, use it, otherwise default to `$HOME/.dotfiles`
export DOTFILES_DIR="${DOTFILES_DIR:-"$HOME/.dotfiles"}"

if [ -f "${ZDOTDIR}/local/.zlogin" ]; then
    . "${ZDOTDIR}/local/.zlogin"
fi

# Source scripts intended to autostart programs on login (e.g. tmux in an ssh session)
. "${DOTFILES_DIR}/shell/autostart.sh"
