# shellcheck shell=bash

if df_command_exists gpg-connect-agent && df_command_exists gpgconf; then
    GPG_TTY="$(tty)"
    export GPG_TTY
    gpg-connect-agent updatestartuptty /bye >/dev/null 2>&1

    unset SSH_AGENT_PID
    if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
        SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
        export SSH_AUTH_SOCK
    fi
fi
