autoload -Uz vcs_info
autoload -Uz add-zsh-hook

dotfiles_setup_vcs_info() {
    PROMPT_VCS_CLEAN_SYMBOL="✓"
    PROMPT_VCS_DIRTY_SYMBOL="✗"
    PROMPT_VCS_STAGED_SYMBOL="✚"
    PROMPT_VCS_UNTRACKED_SYMBOL="✭"
    PROMPT_VCS_COLOR_TEXT="#f5e0dc"
    PROMPT_VCS_COLOR_BRANCH_REV="#cba6f7"
    PROMPT_VCS_COLOR_UNTRACKED="#f9e2af"
    PROMPT_VCS_COLOR_STAGED="#a6e3a1"
    PROMPT_VCS_COLOR_DIRTY="#f38ba8"
    PROMPT_VCS_COLOR_CLEAN="#a6e3a1"
    PROMPT_VCS_COLOR_ACTION="#cba6f7"

    local vcs_format="%{%F{${PROMPT_VCS_COLOR_TEXT}}%}(%{%F{${PROMPT_VCS_COLOR_BRANCH_REV}}%}%b%i%{%F{${PROMPT_VCS_COLOR_TEXT}}%}) %u%c%m"
    local vcs_action_format="${vcs_format} (%{%F{${PROMPT_VCS_COLOR_ACTION}}%}%a%{%f%})"

    zstyle ':vcs_info:*' enable git
    zstyle ':vcs_info:*' get-revision true
    zstyle ':vcs_info:*' check-for-changes true
    zstyle ':vcs_info:*' unstagedstr " %F{${PROMPT_VCS_COLOR_DIRTY}}${PROMPT_VCS_DIRTY_SYMBOL}%f"
    zstyle ':vcs_info:*' stagedstr " %{%F{${PROMPT_VCS_COLOR_STAGED}}%}${PROMPT_VCS_STAGED_SYMBOL}%{%f%}"
    zstyle ':vcs_info:git*' formats " ${vcs_format} "
    zstyle ':vcs_info:git*' actionformats " ${vcs_action_format} "
    zstyle ':vcs_info:git*+set-message:*' hooks git-output-symbols git-untracked git-short-revision-hash

    +vi-git-short-revision-hash() {
        if [ -n "${hook_com[revision]}" ]; then
            hook_com[revision]="%{%F{${PROMPT_VCS_COLOR_TEXT}}%}:%{%F{${PROMPT_VCS_COLOR_BRANCH_REV}}%}${hook_com[revision]:0:12}"
        fi
    }

    +vi-git-output-symbols() {
        if
            [[ $(command git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] &&
            command git diff --no-ext-diff --quiet --exit-code &>/dev/null
        then
            # Hijack the unstaged hook output
            hook_com[unstaged]="%{%B%}%{%F{${PROMPT_VCS_COLOR_CLEAN}}%}${PROMPT_VCS_CLEAN_SYMBOL}%{%f%}%{%b%}"
        else
            hook_com[unstaged]="%{%B%}%{%F{${PROMPT_VCS_COLOR_DIRTY}}%}${PROMPT_VCS_DIRTY_SYMBOL}%{%f%}%{%b%}"
        fi
    }

    +vi-git-untracked() {
        if [[ $(command git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
            command git status --porcelain | grep -m 1 '^??' &>/dev/null
        then
            hook_com[misc]+=" %{%B%}%{%F{${PROMPT_VCS_COLOR_UNTRACKED}}%}${PROMPT_VCS_UNTRACKED_SYMBOL}%{%f%}%{%b%}"
        fi
    }

    _dotfiles_vcs_info_precmd() {
        vcs_info

        # Condense consecutive spaces into a single space
        while [ "${vcs_info_msg_0_//  / }" != "$vcs_info_msg_0_" ]; do
            vcs_info_msg_0_="${vcs_info_msg_0_//  / }"
        done
    }

    add-zsh-hook -Uz precmd _dotfiles_vcs_info_precmd
}

dotfiles_setup_vcs_info

unset dotfiles_setup_vcs_info

