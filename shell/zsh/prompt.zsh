autoload -Uz colors && colors

dotfiles_prompt_setup() {
    local prompt_symbol="❯"

    PROMPT=""

    if [ -n "$SSH_CONNECTION" ] || [ -n "$SSH_TTY" ] || [ $UID -eq 0 ]; then
        PROMPT="%n%{%F{blue}%}@%{%f%}%M %{%F{blue}%}::%{%f%} "
    fi

    local vcs_info_msg_fixed="$(printf "%s" "${vcs_info_msg_0_}" | sed 's/ \{2,\}/ /')"

    PROMPT+='${prompt_user_str}%{%F{blue}%}%3~${vcs_info_msg_0_:- }%{%B%}%(?.%{%F{white}%}.%{%F{red}%})'"${prompt_symbol}"'%{%f%}%{%b%} '
}

dotfiles_prompt_setup

unset dotfiles_prompt_setup
