# Dotfiles

## Installation

Clone the repository:

```sh
git clone https://github.com/aloop/dotfiles.git ~/.dotfiles
```

To setup or update all links and copies, simply run the following command:

```sh
~/.dotfiles/dfctl install
```

On the other hand, you may wish to only update softlinks, hardlinks _or_ copies:

```sh
~/.dotfiles/dfctl install --links # Only setup softlinks

# or:

~/.dotfiles/dfctl install --hardlinks # Only setup hardlinks

# or:

~/.dotfiles/dfctl install --copies # Only setup copies
```

These options can also be in any combination with each other:

```sh
~/.dotfiles/dfctl install --links --copies

# or:

~/.dotfiles/dfctl install --hardlinks --links

# etc.
```

## dfctl on the $PATH

If you've installed the dotfiles and are using `bash` or `zsh` as your shell,
once you open a new shell session `~/.dotfiles/bin` should be on your `$PATH`,
subsequent invocations of `dfctl` in this readme will not include `~/.dotfiles`
in expectation of this.

## Settings Scripts

Settings scripts for various programs and operating systems are kept in `~/.dotfiles/scripts/settings/`,
they can either be called directly (they are shell scripts), or you can call
them through the install script:

```sh
dfctl run settings linux
```

## Install Scripts

Very similar to the settings scripts outlined above, these are scripts meant to
make installing certain pieces of software easier.

```sh
dfctl run install rustup
```

## Backups

Files and Folders to be installed that already exist at the destination
will be backed up by default to a directory similar to:

```sh
~/.dotfiles/backups/${HOST}@2023-01-01T00:00:00.000000
```

### Temporarily disable backup

```sh
dfctl install --no-backups
```

### Disabling backups by default

To disable backups by default, copy the example config file like so:

```sh
cp ~/.dotfiles/config.example.ini ~/.dotfiles/config.ini
```

then edit the file as directed to disable backups.

## Useful Things

### ENV Vars

-   `DF_SWAY_AUTOSTART`: whether or not to start a sway session when a login on tty1 is started. Default is true
-   `DF_TMUX_AUTOSTART`: whether or not to start a tmux session when a terminal is started. Default is false
-   `DF_TMUX_AUTOSTART_SESSION_NAME`: The name of the session which will be automatically created or re-attached to. Default is `df_autostart_session`
-   `path_prepend` and `path_append`: add to the PATH, should be set in ~/.before, in PATH format
-   `DF_ZSH_HIGHLIGHTERS`: set which highlighters to use with zsh-syntax-highlighting. Default is `(main brackets)`

### Local Override Files

-   `~/.gitconfig.local`: override git settings, useful for setting email and name
-   `~/.before`: is sourced near the beginning of `.bash_profile` or `.zshenv`
-   `~/.after`: is sourced near the end of `.bash_profile` or `.zshenv`
-   `~/.zshenv.local`
-   `${ZDOTDIR}/local/.zshrc`
-   `${ZDOTDIR}/local/.zlogin`
-   `~/.bash_profile.local`
-   `~/.bashrc.local`
-   `~/.ssh/config.d/*.conf`: add custom SSH configuration files here
-   `${DOTFILES_DIR}/shell/profile.d/*.sh`: any shell scripts you place in this directory will be sourced by `${DOTFILES_DIR}/shell/profile.sh`
-   `${DOTFILES_DIR}/shell/interactive.d/*.sh`: any shell scripts you place in this directory will be sourced by `${DOTFILES_DIR}/shell/interactive.sh`
-   `${DOTFILES_DIR}/shell/autostart.d/*.sh`: any shell scripts you place in this directory will be sourced by `${DOTFILES_DIR}/shell/autostart.sh`
-   `~/.config/sway/config.d`: add extra config files for sway here

## Todo

-   Add some backup management commands
-   Create a manifest on install which can be used for uninstalling dotfiles
