if [ -f "$HOME/.before" ]; then
    . "$HOME/.before"
fi

shell_includes=("$HOME/.aliases"
                "$HOME/.functions"
                "$HOME/.exports"
                "$HOME/.path"
                "$HOME/.rvm/scripts/rvm"
                "$HOME/.nvm/nvm.sh"
                "$HOME/.after"
                "${shell_includes[@]}")

for shell_include in "${shell_includes[@]}"; do
    if [ -f "$shell_include" ]; then
        . "$shell_include"
    fi
done
