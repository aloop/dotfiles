autoload -Uz colors && colors

dotfiles_prompt_setup() {
    local prompt_symbol="❯"

    PROMPT=""

    if [ -n "$SSH_CONNECTION" ] || [ -n "$SSH_TTY" ] || [ $UID -eq 0 ]; then
        PROMPT="%n%{%F{blue}%}@%{%f%}%M %{%F{blue}%}::%{%f%} "
    fi

    PROMPT+='${prompt_user_str}%{%F{blue}%}%3~%{%f%}$(printf "%s" "${vcs_info_msg_0_:- }" | tr -s " ")%{%B%}%(?.%{%F{white}%}.%{%F{red}%})'"${prompt_symbol}"'%{%f%}%{%b%} '
}

dotfiles_prompt_setup

unset dotfiles_prompt_setup
