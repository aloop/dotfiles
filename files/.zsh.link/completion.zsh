zmodload -i zsh/complist
autoload -U compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' verbose true

# Show a warning when there are no matches
zstyle ':completion:*:warnings' format '%F{red}no matches%f'

# De-prioritize autocomplete functions
zstyle ':completion:*:functions' ignored-patterns '_*'

