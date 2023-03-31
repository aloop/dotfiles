# shellcheck shell=bash

# Make sure we're in an interactive shell
case $- in
    *i*) ;;
      *) return;;
esac

if df_command_exists tmux; then
    # Don't auto-start by default
    : "${DF_TMUX_AUTOSTART:=false}"
    : "${DF_TMUX_AUTOSTART_SSH:=true}"
    : "${DF_TMUX_AUTOSTART_SESSION_NAME:=df_autostart_session}"

    if [ -z "$TMUX_PANE" ] && { [ "$DF_TMUX_AUTOSTART" = "true" ] || { [ -n "$SSH_TTY" ] && [ -n "$SSH_CONNECTION" ] && [ "$DF_TMUX_AUTOSTART_SSH" = "true" ]; }; }; then
        exec tmux new-session -A -s "$DF_TMUX_AUTOSTART_SESSION_NAME"
    fi
fi
