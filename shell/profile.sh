# shellcheck shell=bash

# Create needed functions

df_command_exists() (
    if alias "$1" >/dev/null 2>&1; then
        unalias "$1" >/dev/null 2>&1
    fi

    command -v "$1" >/dev/null 2>&1
)

# Start sourcing

for df_profile_file in "${DOTFILES_DIR}"/shell/profile.d/*.sh; do
    if [ -e "${df_profile_file}" ]; then
        . "${df_profile_file}"
    fi
done
unset df_profile_file

# Let `./interactive` know that we've already initialized
df_profile_initialized="true"
