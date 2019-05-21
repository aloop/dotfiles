# This is based on a filter in oh-my-zsh's termsupport.zsh
_dotfiles_filter_cmd() (
    trim_leading_spaces() (
        str="$1"

        while [ "$str" != "${str#[[:space:]]}" ]; do
            str="${str#[[:space:]]}"
        done

        printf "%s" "$str"
    )

    get_first_word() (
        words="$(trim_leading_spaces "$1")"

        printf "%s" "${words%%[[:space:]]*}"
    )

    full_cmd="$(trim_leading_spaces "$1")"

    first_cmd="$(get_first_word "${full_cmd}")"

    case "$first_cmd" in
        *=*|sudo|ssh|mosh|rake|-*)
            # Filter out the $first_cmd and get the new first command
            second_cmd="$(get_first_word "${full_cmd#$first_cmd}")"
            printf "%s" "$second_cmd"
        ;;

        *)
            printf "%s" "$first_cmd"
        ;;
    esac
)

case "$TERM" in
    cygwin|xterm*|rxvt*|putty*|ansi)

        # Write some info to terminal title.
        # This is seen when the shell prompts for input
        _dotfiles_term_title_precmd() {
            print -Pn "\e]0;zsh %(1j,%j job%(2j|s|); ,)%~\a"
        }

        # Write command and args to terminal title.
        # This is seen while the shell waits for a command to complete.
        _dotfiles_term_title_preexec() (
            printf "\033]0;%s\a" "$(_dotfiles_filter_cmd "$1")"
        )

        precmd_functions+=_dotfiles_term_title_precmd
        preexec_functions+=_dotfiles_term_title_preexec

    ;;

    tmux*|screen*)

        _dotfiles_term_title_precmd() {
            # Restore tmux-title to 'zsh'
            printf "\033kzsh\033\\"
            # Restore urxvt-title to 'zsh'
            print -Pn "\e]2;zsh:%~\a"
        }

        _dotfiles_term_title_preexec() (
            filtered_cmd="$(_dotfiles_filter_cmd "$1")"
            # set tmux-title to running program
            printf "\033k%s\033\\" "$filtered_cmd"
            # set urxvt-title to running program
            print -Pn "\e]2;zsh:$filtered_cmd\a"
        )

        precmd_functions+=_dotfiles_term_title_precmd
        preexec_functions+=_dotfiles_term_title_preexec

    ;;
esac
