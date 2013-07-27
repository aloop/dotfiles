shell_includes=("$HOME/.aliases" "$HOME/.functions" "$HOME/.exports"
                "$HOME/.rvm/scripts/rvm" "$HOME/.path" "$HOME/.custom")

for shell_include in "${shell_includes[@]}"; do
    if [ -f "$shell_include" ]; then
        . "$shell_include"
    fi
done
