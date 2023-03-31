# shellcheck shell=bash

# If `./profile` hasn't been run, run it here
if [ -z "${df_profile_initialized}" ]; then
    . "${DOTFILES_DIR}/shell/profile.sh"
fi

for df_interactive_file in "${DOTFILES_DIR}"/shell/interactive.d/*.sh; do
    if [ -e "${df_interactive_file}" ]; then
        . "${df_interactive_file}"
    fi
done

unset df_interactive_file

