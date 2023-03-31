# Setup history
export HISTFILE="${HOME}/.bash_history"
export HISTCONTROL="erasedups:ignoreboth"
export HISTSIZE=1000
export HISTFILESIZE=10000
# Trim long directory paths in the prompt
PROMPT_DIRTRIM=2
BASH_COMPLETION_USER_DIR="${BASH_COMPLETION_USER_DIR:-"${XDG_DATA_HOME:-"${HOME}/.local/share"}/bash-completion"}"
