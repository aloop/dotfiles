fpath=(
    "${DOTFILES_DIR}/shell/zsh/completions"
    "${DOTFILES_DIR}/shell/zsh/vendor/completions"
    "${fpath[@]}"
)

zmodload -i zsh/complist
autoload -Uz compinit

zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3>7?7:($#PREFIX+$#SUFFIX)/3))numeric)'
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' verbose true
zstyle ':completion:*' special-dirs true

# Show a warning when there are no matches
zstyle ':completion:*:warnings' format '%F{red}no matches%f'

# De-prioritize autocomplete functions
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'

# Try to automatically pick up new executables in $PATH
zstyle ':completion:*' rehash true

# Don't use `named-directories` or `path-directories`
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack

# Collapse multiple slashes to one slash
zstyle ':completion:*' squeeze-slashes true

# Cache completions for better performance with some commands
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$DOTFILES_ZSH_CACHE_DIR"

# Man page completions
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true

# Remove users from ssh completions
zstyle ':completion:*:ssh:*' users

# Use ~/.ssh/known_hosts and ~/.ssh/config as a source for completions
[ -r "${HOME}/.ssh/known_hosts" ] && _dotfiles_ssh_known_hosts=(${${${${(f)"$(<"${HOME}/.ssh/known_hosts")"}:#[\|]*}%%\ *}%%,*}) || _dotfiles_ssh_known_hosts=()
[ -r "${HOME}/.ssh/config" ] && _dotfiles_ssh_config_hosts=($(sed -ne 's/Host[=\t ]//p' < "${HOME}/.ssh/config")) || _dotfiles_ssh_config_hosts=()

_dotfiles_ssh_hosts=(
    "${_dotfiles_ssh_config_hosts[@]}"
    "${_dotfiles_ssh_known_hosts[@]}"
)

zstyle ':completion:*:ssh:*' hosts "${_dotfiles_ssh_hosts[@]}"
unset _dotfiles_ssh_hosts _dotfiles_ssh_known_hosts _dotfiles_ssh_config_hosts

# We don't need to ssh into this machine
zstyle ':completion:*:ssh:*' ignored-patterns "localhost|${HOST}|${HOST}.localdomain"

zstyle '*' single-ignored show

autoload -U +X bashcompinit && bashcompinit
