dotfiles_prompt_setup() {
    local prompt_symbol="❯"

    PROMPT=""

    if [ -n "$SSH_CONNECTION" ] || [ -n "$SSH_TTY" ] || [ $UID -eq 0 ]; then
        PROMPT="%n%{%F{blue}%}@%{%f%}%M %{%F{white}%}::%{%f%} "
    fi

    PROMPT+='%{%F{blue}%}%3~%{%f%}${vcs_info_msg_0_:- }%{%B%}%{%(?.%{%F{white}%}.%{%F{red})%}%}'"${prompt_symbol}"'%{%f%}%{%b%} '
}

dotfiles_prompt_setup

unset dotfiles_prompt_setup
