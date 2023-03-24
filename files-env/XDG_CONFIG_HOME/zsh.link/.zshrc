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

# Install zplug if it doesn't exist
if [ ! -d "${ZPLUG_HOME}" ]; then
    git clone https://github.com/zplug/zplug "${ZPLUG_HOME}" >/dev/null
fi

# Start loading plugins
if [ -f "${ZPLUG_HOME}/init.zsh" ]; then
    . "${ZPLUG_HOME}/init.zsh"

    zplug "zplug/zplug", hook-build:"zplug --self-manage"

    # Add async worker support
    zplug "mafredri/zsh-async", from:"github", use:"async.zsh"

    # inline suggestions
    zplug "zsh-users/zsh-autosuggestions"

    # completions
    zplug "zsh-users/zsh-completions"

    # Allow a user to declare plugins for an individual install
    if [ -f "${ZDOTDIR}/local/plugins.zsh" ]; then
        . "${ZDOTDIR}/local/plugins.zsh"
    fi

    # Syntax highlighting - apparently needs be last
    zplug "zsh-users/zsh-syntax-highlighting", defer:2

    # zplug check returns true if all packages are installed
    # Therefore, when it returns false, run zplug install
    if ! zplug check; then
        zplug install
    fi

    # source plugins and add commands to the PATH
    zplug load
fi

# Source scripts intended for an interactive shell
. "${DOTFILES_DIR}/shell/interactive"

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
