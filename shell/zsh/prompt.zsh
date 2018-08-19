autoload -Uz colors && colors

dotfiles_prompt_setup() {
    local prompt_symbol="❯"

    PROMPT=""

    if [ -n "$SSH_CONNECTION" ] || [ -n "$SSH_TTY" ] || [ $UID -eq 0 ]; then
        PROMPT="%n%F{blue}@%f%M %B%F{blue}::%f%b "
    fi

    PROMPT+='${prompt_user_str}%F{green}%3~%F{yellow}${vcs_info_msg_0_:- }%f%B%(?.%F{blue}.%F{red})'"${prompt_symbol}"'%f%b '
}

dotfiles_prompt_setup

unset dotfiles_prompt_setup
