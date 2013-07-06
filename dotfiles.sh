#!/bin/bash

#
## Variable Assignments
#

# This is set as this scripts directory
dotfile_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
backups_dir="${dotfile_dir}/backups/$(hostname)@$(date "+%Y-%m-%d-%H%M")"

#
## Function Definitions
#
prep_filename() {
    local filename
    filename=$(basename "$1" | sed -E 's/\.(link|copy)$//')
    if [[ "$(echo "$filename" | head -c 1)" != "." ]]; then
        echo ".$filename"
    else
        echo "$filename"
    fi
}

wants_link() {
    if [[ "$1" =~ ".link" ]]; then
        return 0
    fi
    return 1
}

wants_copy() {
    if [[ "$1" =~ ".copy" ]]; then
        return 0
    fi
    return 1
}

backup_original() {
    if [ -e "$1" ]; then
        mv "$1" "$backups_dir"
    fi
}

link_file() {
    ln -sf "$1" "$HOME/$(prep_filename "$1")"
}

copy_file() {
    if [ -e "$1" ]; then
        cp -R "$1" "$HOME/$(prep_filename "$1")"
    fi
}

run() {
    local file

    # Create the backup dir if it doesn't exist
    [[ -e "$backups_dir" ]] || mkdir -p "$backups_dir"

    for file in $(ls -A $dotfile_dir)
    do
        file="$dotfile_dir/$file"
        if wants_copy "$file" || wants_link "$file"; then
            backup_original "$HOME/$(prep_filename "$file")"

            if wants_copy "$file"; then
                copy_file "$file"
                echo -e "Copied \033[1;32m$file\033[0m to \033[1;32m$HOME/$(prep_filename "$file")\033[0m"
            elif wants_link "$file"; then
                link_file "$file"
                echo -e "Linked \033[1;32m$file\033[0m to \033[1;32m$HOME/$(prep_filename "$file")\033[0m"
            fi
        fi
    done
}

#
## Main
#
run
