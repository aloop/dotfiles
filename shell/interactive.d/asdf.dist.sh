# shellcheck shell=bash

if [ -f "$HOME/.asdf/asdf.sh" ]; then
    . "$HOME/.asdf/asdf.sh"

    if [[ -n ${ZSH_VERSION+x} ]]; then
        fpath=("${ASDF_DIR}/completions" $fpath)
    elif [[ -n ${BASH_VERSION+x} ]]; then
        . "${ASDF_DIR}/completions/asdf.bash"
    fi
fi
