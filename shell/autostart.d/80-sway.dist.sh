# shellcheck shell=bash

# Make sure we're in an interactive shell
case $- in
    *i*) ;;
      *) return;;
esac

if [ "${DF_SWAY_AUTOSTART:=true}" = "true" ] && \
    [ -z "$DISPLAY" ] && \
    [ "$(tty)" = "/dev/tty1" ] && \
    df_command_exists sway && \
    df_command_exists systemd-cat
then
    export XDG_CURRENT_DESKTOP=sway
    exec systemd-cat -t sway sway
fi
