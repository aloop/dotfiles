# shellcheck shell=bash

# If `./profile` hasn't been run, run it here
if [ -z "${df_profile_initialized}" ]; then
    . "${DOTFILES_DIR}/shell/profile.sh"
fi

for df_autostart_file in "${DOTFILES_DIR}"/shell/autostart.d/*.sh; do
    if [ -e "${df_autostart_file}" ]; then
        . "${df_autostart_file}"
    fi
done

unset df_autostart_file
unset df_profile_initialized
