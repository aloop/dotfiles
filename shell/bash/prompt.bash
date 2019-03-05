dotfiles_git_prompt() {
    local PROMPT_VCS_CLEAN_SYMBOL='✓'
    local PROMPT_VCS_DIRTY_SYMBOL='✗'

    local output_str=' '

    if df_command_exists git && [[ $(command git rev-parse --is-inside-work-tree 2>/dev/null) == 'true' ]]; then
        # Display the current branch name
        output_str+="on (\[\e[0;34m\]$(command git symbolic-ref --short HEAD 2>/dev/null)\[\e[0m\]"

        # Try and get the current commit hash
        local current_git_hash="$(command git rev-parse --verify HEAD 2>/dev/null)"

        # Show the hash of the current commit if available
        if [ -n "${current_git_hash}" ]; then
            output_str+=":\[\e[0;34m\]${current_git_hash:0:12}\[\e[0m\]) "
        else
            output_str+=") "
        fi

        # Show a symbol if the repo is dirty, otherwise show a symbol for clean
        if command git diff --no-ext-diff --quiet --exit-code &>/dev/null; then
            output_str+="\[\e[1;32m\]${PROMPT_VCS_CLEAN_SYMBOL}\[\e[0m\]"
        else
            output_str+="\[\e[1;31m\]${PROMPT_VCS_DIRTY_SYMBOL}\[\e[0m\]"
        fi

        # Display if a rebase is in progress
        local git_current_action=''
        if [ -d "$(command git rev-parse --git-path rebase-merge 2>/dev/null)" ]; then
            git_current_action="rebase-i"
        elif [ -d "$(command git rev-parse --git-path rebase-apply 2>/dev/null)" ]; then
            git_current_action="rebase"
        fi

        if [ -n "${git_current_action}" ]; then
            output_str+=" (\[\e[0;31m\]${git_current_action}\[\e[0m\]) "
        fi
    fi

    printf "%s " "${output_str}" | tr -s ' '
}

dotfiles_prompt_setup() {
    local last_exit_code="$?"
    local prompt_symbol='❯'

    PS1=''

    if [ -n "$SSH_CONNECTION" ] || [ -n "$SSH_TTY" ] || [ $UID -eq 0 ]; then
        PS1='\u\[\e[0;34m\]@\[\e[0m\]\H :: '
    fi

    PS1+="\[\e[0;34m\]\w\[\e[0m\]$(dotfiles_git_prompt)"

    if [ "$last_exit_code" != 0 ]; then
        PS1+="\[\e[0;31m\]${prompt_symbol}\[\e[0m\] "
    else
        PS1+="${prompt_symbol} "
    fi
}

PROMPT_COMMAND=dotfiles_prompt_setup

