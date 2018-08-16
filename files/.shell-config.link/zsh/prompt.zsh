autoload -Uz colors && colors

dotfiles_prompt_setup() {
    local prompt_symbol="❯"
    local prompt_user_str=""

    if [ -n "$SSH_CONNECTION" ] || [ -n "$SSH_TTY" ] || [ $UID -eq 0 ]; then
        local prompt_user_str="%n%F{blue}@%f%M %B%F{blue}::%f%b "
    fi

    PROMPT='${prompt_user_str}%F{green}%3~%F{yellow}${vcs_info_msg_0_:- }%f%B%(?.%F{blue}.%F{red})'
    PROMPT+="${prompt_symbol}"
    PROMPT+='%f%b '
}

dotfiles_prompt_setup

unset dotfiles_prompt_setup
