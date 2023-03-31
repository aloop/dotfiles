# Helpful documentation:
# @url https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html
#
# %{%K{color}%} %{%k%} sets and ends background color
# %{%F{color}%} %{%f%} sets and ends foreground color
# %{%B%} %{%b%} sets and ends bold

dotfiles_prompt_setup() {
    local prompt_start_symbol=""
    local prompt_end_symbol=""
    local prompt_separator_symbol=""

    local error_color="#f38ba8"
    local user_bg="%(?.#cba6f7.${error_color})"
    local user_fg="#1e1e2e"
    local dir_bg="#313244"
    local dir_fg="#cba6f7"
    local vcs_info_bg="#45475a"

    local user_prompt_fmt="%n"

    # Start of prompt
    PROMPT="%{%F{${user_bg}}%}${prompt_start_symbol}%{%K{${user_bg}}%}%{%F{${user_fg}}%} "

    if [ -n "$SSH_CONNECTION" ] || [ -n "$SSH_TTY" ] || [ $UID -eq 0 ]; then
        # Extra info (user@hostname) when in an ssh session
        user_prompt_fmt="%n@%M"
    fi

    # User prompt section
    PROMPT+="%{%F{${user_fg}}%}${user_prompt_fmt} %{%K{${dir_bg}}%}%{%F{${user_bg}}%}${prompt_separator_symbol}%{%F{${dir_fg}}%} %3~ "

    # VCS info section
    PROMPT+='${vcs_info_msg_0_:+"%{%F{'"${dir_bg}"'}%}%{%K{'"${vcs_info_bg}"'}%}'"${prompt_separator_symbol}"'"}${vcs_info_msg_0_}'

    # End of prompt
    PROMPT+='%{%F{'"${dir_bg}"'}%}${vcs_info_msg_0_:+"%{%F{'"${vcs_info_bg}"'}%}"}%{%k%}'"${prompt_end_symbol}%{%f%} "
}

dotfiles_prompt_setup

unset dotfiles_prompt_setup

