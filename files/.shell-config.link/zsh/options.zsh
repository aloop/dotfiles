setopt no_beep
setopt multios
setopt interactive_comments
setopt extended_glob
setopt noglobdots
setopt append_create
unsetopt flowcontrol

## Prompt
setopt prompt_subst
setopt transient_rprompt

## Completion
unsetopt menu_complete
setopt auto_menu
setopt auto_name_dirs
setopt complete_in_word
setopt always_to_end

## Navigation
setopt auto_cd
setopt cdablevars
setopt auto_pushd
setopt pushd_silent
setopt pushd_ignore_dups

## History
setopt append_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_find_no_dups
setopt hist_reduce_blanks
setopt hist_verify
setopt share_history

## Jobs
setopt longlistjobs # Show PID when suspending process
setopt notify
