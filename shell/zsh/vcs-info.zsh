autoload -Uz vcs_info

dotfiles_setup_vcs_info() {
    PROMPT_VCS_CLEAN_SYMBOL='✓'
    PROMPT_VCS_DIRTY_SYMBOL='✗'
    PROMPT_VCS_STAGED_SYMBOL='✚'
    PROMPT_VCS_UNTRACKED_SYMBOL='✭'

    zstyle ':vcs_info:*' enable git
    zstyle ':vcs_info:*' get-revision true
    zstyle ':vcs_info:*' check-for-changes true
    zstyle ':vcs_info:*' stagedstr " %{%F{yellow}%}${PROMPT_VCS_STAGED_SYMBOL}%{%f%}"
    zstyle ':vcs_info:git*' actionformats " %{%F{white}%}on%{%f%} (%{%F{blue}%}%b%i%{%f%}) %u%c%m (%{%F{red}%}%a%{%f%}) "
    zstyle ':vcs_info:git*' formats ' %{%F{white}%}on%{%f%} (%{%F{blue}%}%b%i%{%f%}) %u%c%m '
    zstyle ':vcs_info:git*set-message:*' hooks git-output-symbols git-untracked git-short-revision-hash

    +vi-git-short-revision-hash() {
        if [ -n "${hook_com[revision]}" ]; then
            hook_com[revision]="%{%F{white}%}:%{%F{blue}%}${hook_com[revision]:0:12}"
        fi
    }

    +vi-git-output-symbols() {
        if
            [[ $(command git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] &&
            command git diff --no-ext-diff --quiet --exit-code &>/dev/null
        then
            # Hijack the unstaged hook output
            hook_com[unstaged]="%{%B%}%{%F{green}%}${PROMPT_VCS_CLEAN_SYMBOL}%{%f%}%{%b%}"
        else
            hook_com[unstaged]="%{%B%}%{%F{red}%}${PROMPT_VCS_DIRTY_SYMBOL}%{%f%}%{%b%}"
        fi
    }

    +vi-git-untracked() {
        if [[ $(command git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
            command git status --porcelain | grep -m 1 '^??' &>/dev/null
        then
            hook_com[misc]+=" %{%B%}%{%F{cyan}%}${PROMPT_VCS_UNTRACKED_SYMBOL}%{%f%}%{%b%}"
        fi
    }

    vcs_info_precmd() {
        vcs_info
        # Condense consecutive spaces into a single space
        vcs_info_msg_0_="$(printf "%s" "${vcs_info_msg_0_:- }" | tr -s ' ')"
    }

    precmd_functions+=vcs_info_precmd
}

dotfiles_setup_vcs_info

unset dotfiles_setup_vcs_info

