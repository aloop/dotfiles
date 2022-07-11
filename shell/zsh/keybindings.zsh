zmodload zsh/terminfo

if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    zle-line-init() {
        echoti smkx
    }

    zle-line-finish() {
        echoti rmkx
    }

    zle -N zle-line-init
    zle -N zle-line-finish
fi

typeset -A df_key

df_key[Home]=${terminfo[khome]}
df_key[End]=${terminfo[kend]}
df_key[Insert]=${terminfo[kich1]}
df_key[Delete]=${terminfo[kdch1]}
df_key[PageUp]=${terminfo[kpp]}
df_key[PageDown]=${terminfo[knp]}
df_key[Up]=${terminfo[kcuu1]}
df_key[Down]=${terminfo[kcud1]}
df_key[Left]=${terminfo[kcub1]}
df_key[Right]=${terminfo[kcuf1]}

df_safe_bindkey() {
    [ -n "$1" ] && bindkey "$1" "$2"
}

# Use emacs bindings
bindkey -e

# Expand on space
bindkey ' ' magic-space

# Let up-arrow fuzzy search with the current line
autoload -U up-line-or-beginning-search
zle -N up-line-or-beginning-search
df_safe_bindkey "${df_key[Up]}" up-line-or-beginning-search

# Let down-arrow fuzzy search with the current line
autoload -U down-line-or-beginning-search
zle -N down-line-or-beginning-search
df_safe_bindkey "${df_key[Down]}" down-line-or-beginning-search

# Enable home and end keys
df_safe_bindkey "${df_key[Home]}" beginning-of-line
df_safe_bindkey "${df_key[End]}" end-of-line

bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

# Enable Delete
df_safe_bindkey "${df_key[Delete]}" delete-char

bindkey "^K" kill-whole-line

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

# Remove local variables and functions
unset df_key
unset -f df_safe_bindkey
