# shellcheck shell=bash

# Enable aliases in sudo commands
alias sudo="sudo "

if df_command_exists nvim; then
    alias vim="nvim"
    alias vi="nvim"
    alias e="nvim"
    alias vimdiff="nvim -d"
elif df_command_exists vim; then
    alias vi="vim"
    alias e="vim"
fi

alias grep="grep --color=auto"
alias df="df -h"
# I usually only use du to get the total space used by a directory
alias du="du -hcs"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

if df_command_exists lsd; then
    # shellcheck disable=SC2262
    alias ls="lsd"
    # List all files and directories
    alias l="lsd --long --classify --almost-all"
    alias la="lsd --long --classify --almost-all"
    # List all non-hidden files and directories
    alias ll="lsd --long --classify"
    # List all symlinks in the current directory
    alias lsl='ll $(find -maxdepth 1 -type l -print)'
    alias lt="l --tree"
elif df_command_exists exa; then
    # shellcheck disable=SC2262
    alias ls="exa"
    # List all files and directories
    alias l="exa --long --group --classify --all"
    alias la="exa --long --group --classify --all"
    # List all non-hidden files and directories
    alias ll="exa --long --group --classify"
    # List all symlinks in the current directory
    alias lsl='exa --long --group --classify $(find -maxdepth 1 -type l -print)'
    alias lt="l --tree"
else
    if ls --color=auto / >/dev/null 3>&1; then
        alias ls="ls -F --color=auto"
    else
        alias ls="ls -F"
    fi

    # List all files and directories
    alias l="ls -lAh"
    alias la="ls -lAh"
    # List all non-hidden files and directories
    alias ll="ls -lh"
    # List all symlinks in the current directory
    alias lsl='ls -lh $(find -maxdepth 1 -type l -print)'
fi

# Git aliases
alias g="git"
alias ga="git add"
alias gd="git diff"
alias gds="git diff --staged"
alias gl="git log"
alias gb="git branch"
alias gc="git checkout"
alias gcb="git checkout -b"
alias gst="git status"
alias gr="git reset"
alias grh="git reset HEAD"

## youtube-dl aliases
alias ytdl="yt-dlp -f 'bestvideo[ext!=webm]+bestaudio[ext!=webm]/best[ext!=webm]'"

# For long-running applications that you don't want to exit when you log out
# on some systems running systemd
alias daemonize="systemd-run --scope --user"

alias music="ncmpcpp -q"

alias iso8602='date -u +"%Y-%m-%dT%H:%M:%SZ"'

alias weather='curl https://wttr.in'

alias ip='ip --color=auto'
