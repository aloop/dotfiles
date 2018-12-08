fpath=(
    "${DOTFILES_DIR}/shell/zsh/completions"
    "$fpath[@]"
)

zmodload -i zsh/complist
autoload -Uz compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' verbose true
zstyle ':completion:*' special-dirs true

# Show a warning when there are no matches
zstyle ':completion:*:warnings' format '%F{red}no matches%f'

# De-prioritize autocomplete functions
zstyle ':completion:*:functions' ignored-patterns '_*'

# Try to automatically pick up new executables in $PATH
zstyle ':completion:*' rehash true

# Don't use `named-directories` or `path-directories`
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack

# Cache completions for better performance with some commands
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path "$DOTFILES_ZSH_CACHE_DIR"

# Remove users from ssh completions
zstyle ':completion:*:ssh:*' users

# Use ~/.ssh/known_hosts and ~/.ssh/config as a source for completions
[ -r ~/.ssh/known_hosts ] && _dotfiles_ssh_known_hosts=(${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[\|]*}%%\ *}%%,*}) || _dotfiles_ssh_known_hosts=()
[ -r ~/.ssh/config ] && _dotfiles_ssh_config_hosts=($(cat ~/.ssh/config | sed -ne 's/Host[=\t ]//p')) || _dotfiles_ssh_config_hosts=()

_dotfiles_ssh_hosts=(
    "$_dotfiles_ssh_config_hosts[@]"
    "$_dotfiles_ssh_known_hosts[@]"
)

zstyle ':completion:*:ssh:*' hosts $_dotfiles_ssh_hosts
unset _dotfiles_ssh_hosts _dotfiles_ssh_known_hosts _dotfiles_ssh_config_hosts

# We don't need to ssh into this machine
zstyle ':completion:*:ssh:*' ignored-patterns "localhost|${HOST}|${HOST}.localdomain"

zstyle '*' single-ignored show

