autoload -Uz colors && colors

prompt_user_str=""

if [ -n "$SSH_CONNECTION" ] || [ -n "$SSH_TTY" ] || [ $UID -eq 0 ]; then
    prompt_user_str="%n%F{blue}@%f%m %B%F{blue}::%f%b "
fi

return_code="%(?..%F{red}%? ↵%f)"

PROMPT='${prompt_user_str}%F{green}%3~%F{yellow}${vcs_info_msg_0_:- }%f%B%(!.%F{red}.%F{blue})»%f%b '

RPS1="${return_code}"
