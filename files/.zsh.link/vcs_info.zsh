autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git*' actionformats "<%b%m%u%c (%a)> "
zstyle ':vcs_info:git*' formats "<%b%m%u%c> "
zstyle ':vcs_info:git*' stagedstr "*"
zstyle ':vcs_info:git*' unstagedstr "*"
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

+vi-git-untracked(){
    local untrackedstr=''

    if [[ $(git rev-parse --is-inside-work-tree &> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null ; then
        zstyle -s ':vcs_info:git*' stagedstr untrackedstr
        hook_com[unstaged]=$untrackedstr
    fi
}

precmd() { vcs_info; }
