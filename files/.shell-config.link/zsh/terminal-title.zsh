case $TERM in
  (xterm*|rxvt*|putty*)

    # Write some info to terminal title.
    # This is seen when the shell prompts for input
    term_title_precmd() {
      print -Pn "\e]0;zsh%L %(1j,%j job%(2j|s|); ,)%~\a"
    }
    # Write command and args to terminal title.
    # This is seen while the shell waits for a command to complete.
    term_title_preexec() {
      printf "\033]0;%s\a" "$1"
    }

    precmd_functions+=term_title_precmd
    preexec_functions+=term_title_preexec

  ;;
esac
