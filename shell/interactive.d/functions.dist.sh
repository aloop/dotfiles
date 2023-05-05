# shellcheck shell=bash

is_osx() {
    [ "$(uname)" = "Darwin" ]
}

# Open a link (probably works for file paths as well)
# in the systems default browser
open_link() {
    if is_osx && df_command_exists open; then
        open "$1"
    elif df_command_exists xdg-open; then
        xdg-open "$1"
    fi
}

# Launch an http server in the current directory
# and optionally open it in the default browser
server() (
    port="8000"

    if [ "$1" != "--no-browser" ] && [ "$1" != "-n" ]; then
        (sleep 1 && open_link "http://localhost:${port}/") &
    fi

    if df_command_exists python3; then
        python3 -m http.server "$port"
    elif df_command_exists python; then
        python -m SimpleHTTPServer "$port"
    else
        printf "couldn't start server, suitable python version not found" >&2
        exit 1
    fi
)

pretty_print_path() {
    echo "$PATH" | tr ':' "\n"
}

# WP-CLI helpers

wp_migrate_url() (
    oldhost="$1"
    newhost="$2"

    if [ -z "$oldhost" ]; then
        echo "1st parameter for old hostname not given"
        exit 1
    fi

    if [ -z "$newhost" ]; then
        echo "2nd parameter for new hostname not given"
        exit 1
    fi

    # Backup database first
    wp db export
    # Replace `$oldhost` with `$newhost` without altering GUIDs
    wp search-replace --skip-columns='guid' --url="$oldhost" "$oldhost" "$newhost"
)

# Generate a sha256 hash for usage with Content-Security-Protection

gen_csp_hash() {
    printf 'sha256-%s\n' "$(printf '%s' "$1" | openssl dgst -binary -sha256 | openssl base64)"
}

gen_salt() {
    [ -c /dev/urandom ] || { echo 'ERROR: Random source /dev/urandom not available.' >&2; return 1; }
    LC_ALL=C tr -cd 'a-zA-Z0-9,;.:_#*+~!@$%&()=?{[]}|><-' < /dev/urandom | head -c "${1:-64}"
}

gen_argon2i_hash() {
    if [ -z "$1" ]; then
        echo "No password given. Exiting..."
        return 1
    fi

    if command -v argon2 &>/dev/null; then
        printf "%s" "$1" | argon2 "$(gen_salt 64)" -e
    else
        echo "argon2 not installed. Exiting..."
    fi
}

gen_caddy_basicauth_hash() {
    if command -v caddy &>/dev/null; then
        local _tmp_salt
        _tmp_salt="$(gen_salt 64)"
        caddy hash-password --algorithm "scrypt" --salt "$_tmp_salt"
        printf "%s" "$_tmp_salt" | base64
    else
        echo "Caddy is not installed. Exiting..."
    fi
}

# Color Picker

colorpicker() (
    grim -g "$(slurp -p)" - -t png -o | convert png:- -format '%[pixel:s]\n' info:- | awk -F '[(,)]' '{printf("#%02x%02x%02x\n",$2,$3,$4)}'
)

# Create a directory and cd into it
mkcd() {
    mkdir -p "$1" && cd "$1" || exit
}

# Checkout the latest tag from a git repo in a format like v1*
git-checkout-latest-version() {
    git checkout "$(git describe --abbrev=0 --tags --match "v[0-9]*" "$(git rev-list --tags --max-count=1)")"
}

# Helpers for working with the dotfiles

dotfiles() (
    "${DOTFILES_DIR}/dotfiles" "$@"
)
