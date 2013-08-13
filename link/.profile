shell_includes=("$HOME/.before" "$HOME/.aliases" "$HOME/.functions"
                "$HOME/.exports" "$HOME/.path" "$HOME/.rvm/scripts/rvm"
                "$HOME/.after")

for shell_include in "${shell_includes[@]}"; do
    if [ -f "$shell_include" ]; then
        . "$shell_include"
    fi
done
