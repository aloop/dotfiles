# Ensure that $DOTFILES_ZSH_PLUGINS_DIR is set
if [ -z "${DOTFILES_ZSH_PLUGINS_DIR}" ]; then
    return 0
fi

# Ensure that $DOTFILES_ZSH_PLUGINS_DIR exists
if [ ! -d "${DOTFILES_ZSH_PLUGINS_DIR}" ]; then
    mkdir -p "${DOTFILES_ZSH_PLUGINS_DIR}"
fi

declare -a _df_zsh_plugin_install_dirs
_df_zsh_plugin_install_dirs=()

df_plugin() {
    local plugin_url="$1"
    # Operate under the convention of having a script named
    # the same as the repo, with an added .plugin.zsh extension
    #
    # For example: zsh-users/zsh-completions => zsh-completions.plugin.zsh
    local plugin_script_name="${2:-"$(basename "${1}").plugin.zsh"}"
    local repo_name="${3:-"$(basename "${1}")"}"
    local plugin_path="${DOTFILES_ZSH_PLUGINS_DIR}/${repo_name}"
    local plugin_script_path="${plugin_path}/${plugin_script_name}"

    if [ -z "$plugin_url" ]; then
        return 0
    fi

    if [ ! -d "${plugin_path}" ]; then
        command git clone "${plugin_url}" "${plugin_path}"
    fi

    if [ -f "${plugin_script_path}" ]; then
        . "${plugin_script_path}"
    fi

    # If we've gotten this far, it should mean the plugin is installed and sourced,
    # so it should be safe to add it's path to our installed plugins array
    _df_zsh_plugin_install_dirs+="$plugin_path"
}

df_update_plugins() (
    for plugin_dir in ${_df_zsh_plugin_install_dirs[@]}; do
        if [ -d "$plugin_dir" ]; then
            cd "$plugin_dir"
            echo "Updating plugin at \"${plugin_dir#"${DOTFILES_ZSH_PLUGINS_DIR}/"}\""
            git pull
        fi
    done
)
