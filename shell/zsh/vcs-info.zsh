autoload -Uz vcs_info

dotfiles_setup_vcs_info() {
    PROMPT_VCS_CLEAN_SYMBOL='✓'
    PROMPT_VCS_DIRTY_SYMBOL='✗'

    zstyle ':vcs_info:*' enable git
    zstyle ':vcs_info:*' get-revision true
    zstyle ':vcs_info:git*' actionformats " %{%F{white}%}on%{%f%} (%{%F{blue}%}%b%i%{%f%}) %m %u (%{%F{red}%}%a%{%f%}) "
    zstyle ':vcs_info:git*' formats ' %{%F{white}%}on%{%f%} (%{%F{blue}%}%b%i%{%f%}) %m %u '
    zstyle ':vcs_info:git*set-message:*' hooks git-output-symbols git-short-revision-hash

    +vi-git-short-revision-hash() {
        if [ -n "${hook_com[revision]}" ]; then
            hook_com[revision]="%{%F{white}%}:%{%F{blue}%}${hook_com[revision]:0:12}"
        fi
    }

    +vi-git-output-symbols() {
        if
            [[ $(command git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] &&
            command git diff --no-ext-diff --quiet --exit-code
        then
            # Hijack the unstaged hook output
            hook_com[unstaged]="%{%B%}%{%F{green}%}${PROMPT_VCS_CLEAN_SYMBOL}%{%f%}%{%b%}"
        else
            hook_com[unstaged]="%{%B%}%{%F{red}%}${PROMPT_VCS_DIRTY_SYMBOL}%{%f%}%{%b%}"
        fi
    }

    vcs_info_precmd() {
        vcs_info
        # Perform some extra formatting and cleanup
        vcs_info_msg_0_="$(printf "%s" "${vcs_info_msg_0_:- }" | tr -s ' ')"
    }

    precmd_functions+=vcs_info_precmd
}

dotfiles_setup_vcs_info

unset dotfiles_setup_vcs_info

