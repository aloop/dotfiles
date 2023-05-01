setopt multios
setopt interactive_comments
setopt extended_glob
setopt append_create
setopt pipefail
unsetopt beep
unsetopt glob_dots
unsetopt case_glob
unsetopt flow_control
unsetopt nomatch

## Prompt
setopt prompt_subst
setopt transient_rprompt

## Completion
setopt auto_menu
setopt auto_list
setopt path_dirs
setopt complete_in_word
setopt always_to_end
setopt auto_param_slash
unsetopt menu_complete

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
