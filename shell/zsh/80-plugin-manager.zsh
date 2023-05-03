# Ensure that $DOTFILES_ZSH_PLUGINS_DIR is set
if [ -z "${DOTFILES_ZSH_PLUGINS_DIR}" ]; then
    return 0
fi

# Ensure that $DOTFILES_ZSH_PLUGINS_DIR exists
if [ ! -d "${DOTFILES_ZSH_PLUGINS_DIR}" ]; then
    mkdir -p "${DOTFILES_ZSH_PLUGINS_DIR}"
fi

df_plugin() {
    local plugin_url="$1"
    # Operate under the convention of having a script named
    # the same as the repo, with an added .plugin.zsh extension
    #
    # For example: zsh-users/zsh-completions => zsh-completions.plugin.zsh
    local plugin_script_name="${2:-"$(basename "${1}").plugin.zsh"}"
    local repo_name="${3:-"$(basename "${1}")"}"
    local plugin_source_path="${DOTFILES_ZSH_PLUGINS_DIR}/${repo_name}/${plugin_script_name}"

    if [ -z "$plugin_url" ]; then
        return 0
    fi

    if [ ! -d "${DOTFILES_ZSH_PLUGINS_DIR}/${repo_name}" ]; then
        command git clone "${plugin_url}" "${DOTFILES_ZSH_PLUGINS_DIR}/${repo_name}"
    fi

    if [ -f "${plugin_source_path}" ]; then
        . "${plugin_source_path}"
    fi
}
