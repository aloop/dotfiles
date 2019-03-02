autoload -Uz vcs_info

dotfiles_setup_vcs_info() {
    PROMPT_VCS_CLEAN_SYMBOL='✓'
    PROMPT_VCS_DIRTY_SYMBOL='✗'

    zstyle ':vcs_info:*' enable git
    zstyle ':vcs_info:*' get-revision true
    zstyle ':vcs_info:*' check-for-changes true
    zstyle ':vcs_info:git*' actionformats " %{%F{white}%}on%{%f%} %{%F{blue}%}%b%{%f%} %m%{%F{red}%}%u%c%{%f%} (%{%F{red}%}%a%{%f%}) "
    zstyle ':vcs_info:git*' formats " %{%F{white}%}on%{%f%} %{%F{blue}%}%b%{%f%} %m%{%F{red}%}%u%c%{%f%} "
    zstyle ':vcs_info:git*' stagedstr $PROMPT_VCS_DIRTY_SYMBOL
    zstyle ':vcs_info:git*' unstagedstr $PROMPT_VCS_DIRTY_SYMBOL
    zstyle ':vcs_info:git*+set-message:*' hooks is-git-dirty

    +vi-is-git-dirty() {
        if
            [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] &&
            git diff --quiet --ignore-submodules HEAD &>/dev/null
        then
            # Hijack the staged hook output
            hook_com[staged]="%{%B%}%{%F{green}%}${PROMPT_VCS_CLEAN_SYMBOL}%{%f%}%{%b%}"
        fi
    }

    vcs_info_precmd() {
        vcs_info
        # Perform some extra formatting and cleanup
        vcs_info_msg_0_="$(printf "%s" "${vcs_info_msg_0_:- }" | tr -s ' ' | sed -e "s/${PROMPT_VCS_DIRTY_SYMBOL}\{2,\}/$PROMPT_VCS_DIRTY_SYMBOL/")"
    }

    precmd_functions+=vcs_info_precmd
}

dotfiles_setup_vcs_info

unset dotfiles_setup_vcs_info

