[[ -z $precmd_functions ]] && precmd_functions=()
[[ -z $preexec_functions ]] && preexec_functions=()

# Make sure the XDG cache directory exists
if [ ! -d "${XDG_CACHE_HOME}/zsh" ]; then
    mkdir -p "${XDG_CACHE_HOME}/zsh"
fi

# Make sure the XDG state directory exists
if [ ! -d "${XDG_STATE_HOME}/zsh" ]; then
    mkdir -p "${XDG_STATE_HOME}/zsh"
fi

# Source scripts intended for an interactive shell
. "${DOTFILES_DIR}/shell/interactive.sh"

# Load zsh config files
for df_zshrc_file in "${DOTFILES_DIR}"/shell/zsh/*.zsh; do
    if [ -f "${df_zshrc_file}" ]; then
        . "${df_zshrc_file}"
    fi
done
unset df_zshrc_file

if [ -f "${ZDOTDIR}/local/.zshrc" ]; then
    . "${ZDOTDIR}/local/.zshrc"
fi

autoload -Uz compinit
# Initialize completions, with a full run once a day
if [[ -n "${XDG_CACHE_HOME}"/zsh/zcompdump(#qN.mh+24) ]]; then
    compinit -d "${XDG_CACHE_HOME}/zsh/zcompdump"
    compdump
else
    compinit -C -d "${XDG_CACHE_HOME}/zsh/zcompdump"
fi
