setopt multios
setopt interactive_comments
setopt extended_glob
setopt append_create
setopt pipefail
setopt no_beep
setopt no_glob_dots
setopt no_flow_control
setopt no_no_match

## Prompt
setopt prompt_subst
setopt transient_rprompt

## Completion
setopt no_menu_complete
setopt auto_menu
setopt auto_name_dirs
setopt complete_in_word
setopt always_to_end
setopt no_auto_remove_slash
#setopt rec_exact

## Navigation
setopt auto_cd
setopt cdable_vars
setopt auto_pushd
setopt pushd_silent
setopt pushd_ignore_dups

## History
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_find_no_dups
setopt hist_reduce_blanks
setopt hist_verify
setopt hist_no_store
#setopt hist_fcntl_lock
setopt share_history

## Jobs
setopt longlistjobs # Show PID when suspending process
setopt notify
