# shellcheck shell=bash

_df_path_prepend="${path_prepend:+"$path_prepend:"}\
${HOME}/.yarn/bin\
:/usr/local/bin\
:/usr/local/sbin"

_df_path_append="${HOME}/.cabal/bin\
${GOPATH:+":$GOPATH/bin"}\
:${HOME}/.composer/vendor/bin\
:${HOME}/.cargo/bin\
:${HOME}/.fnm\
:${HOME}/.bin\
:${HOME}/.local/bin\
:${DOTFILES_DIR:-"${HOME}/.dotfiles"}/bin\
${path_append:+":$path_append"}"

_df_is_in_path() {
    case "$1" in
        "$2":*)   return 0 ;;
        *:"$2")   return 0 ;;
        *:"$2":*) return 0 ;;
        *)        return 1 ;;
    esac
}

_df_filter_segment() (
    _temp_path="$1"
    _segment="$2"

    if [ "$_temp_path" = "$_segment" ]; then
        _temp_path=""
    else
        while _df_is_in_path "$_temp_path" "${_segment}"; do
            _temp_path=${_temp_path//":${_segment}:"/:}
            _temp_path=${_temp_path/#"${_segment}:"/}
            _temp_path=${_temp_path/%":${_segment}"/}
        done
    fi

    printf "%s" "$_temp_path"
)

_df_process_path() (
    _filtered_path="$1"
    _path_prepend="$2"
    _path_append="$3"

    IFS=:

    set -o noglob

    if [ -n "$ZSH_VERSION" ]; then
        setopt shwordsplit
    fi

    if [ -n "$_path_prepend" ]; then
        for _segment in $_path_prepend; do
            if [ -n "$_segment" ]; then
                _filtered_path="${_segment}:$(_df_filter_segment "$_filtered_path" "$_segment")"
            fi
        done
    fi

    if [ -n "$_path_append" ]; then
        for _segment in $_path_append; do
            if [ -n "$_segment" ]; then
                _filtered_path="$(_df_filter_segment "$_filtered_path" "$_segment"):${_segment}"
            fi
        done
    fi

    printf "%s" "$_filtered_path"
)

# Set updated $PATH
PATH="$(_df_process_path "$PATH" "$_df_path_prepend" "$_df_path_append")"

# Remove multiple consecutive colons
while [ "${PATH//::/:}" != "$PATH" ]; do
    PATH="${PATH//::/:}"
done

# Remove leading and trailing colons
PATH="${PATH#:}"
PATH="${PATH%:}"

unset _df_path_prepend _df_path_append _df_is_in_path _df_filter_segment _df_process_path

