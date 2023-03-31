autoload -Uz add-zsh-hook

# This is based on a filter in oh-my-zsh's termsupport.zsh
_dotfiles_filter_cmd() {
    local trim_leading_spaces() (
        str="$1"

        while [ "$str" != "${str#[[:space:]]}" ]; do
            str="${str#[[:space:]]}"
        done

        printf "%s" "$str"
    )

    local get_first_word() (
        words="$(trim_leading_spaces "$1")"

        printf "%s" "${words%%[[:space:]]*}"
    )

    local full_cmd="$(trim_leading_spaces "$1")"

    local first_cmd="$(get_first_word "${full_cmd}")"

    case "$first_cmd" in
        *=*|sudo|ssh|mosh|-*)
            # Filter out the $first_cmd and get the new first command
            second_cmd="$(get_first_word "${full_cmd#$first_cmd}")"
            printf "%s" "$second_cmd"
        ;;

        *)
            printf "%s" "$first_cmd"
        ;;
    esac
}

_dotfiles_set_terminal_title_precmd () {
    print -Pn -- '\e]2;zsh %(1j,\(%j job%(2j|s|)\) ,)%~\a'
}

_dotfiles_set_terminal_title_preexec () {
    local filtered_cmd="$(_dotfiles_filter_cmd "$1")"

    print -Pn -- '\e]2;' && print -n -- "${(q)filtered_cmd}\a"
}

if [[ "$TERM" == (Eterm*|alacritty*|aterm*|foot*|gnome*|konsole*|kterm*|putty*|rxvt*|screen*|wezterm*|tmux*|xterm*) ]]; then
    add-zsh-hook -Uz precmd _dotfiles_set_terminal_title_precmd
    add-zsh-hook -Uz preexec _dotfiles_set_terminal_title_preexec
fi
