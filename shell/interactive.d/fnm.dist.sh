# shellcheck shell=bash

if df_command_exists fnm; then
    eval "$(fnm env --use-on-cd)"
fi