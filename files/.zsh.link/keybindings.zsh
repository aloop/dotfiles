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

typeset -A key

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}

safebindkey() {
    [ -n "$1" ] && bindkey "$1" "$2"
}

# Use emacs bindings
bindkey -e

# Expand on space
bindkey ' ' magic-space

# Let up-arrow fuzzy search with the current line
autoload -U up-line-or-beginning-search
zle -N up-line-or-beginning-search
safebindkey "${key[Up]}" up-line-or-beginning-search

# Let down-arrow fuzzy search with the current line
autoload -U down-line-or-beginning-search
zle -N down-line-or-beginning-search
safebindkey "${key[Down]}" down-line-or-beginning-search

# Enable home and end keys
safebindkey "${key[Home]}" beginning-of-line
safebindkey "${key[End]}" end-of-line

# Enable Delete
safebindkey "${key[Delete]}" delete-char

bindkey "^K" kill-whole-line # ctrl-k
