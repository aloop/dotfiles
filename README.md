# Dotfiles

## Installation

Clone the repository:

```sh
git clone https://github.com/aloop/dotfiles.git ~/.dotfiles
```

To setup or update all links and copies, simply run the following command:

```sh
~/.dotfiles/dotfiles
```

On the other hand, you may wish to only update links *or* copies:

```sh
~/.dotfiles/dotfiles --no-copies # Only setup links
```

or:

```sh
~/.dotfiles/dotfiles --no-links # Only setup copies
```

See "Install Script ENV Vars" below to learn how to set these options by default.

## System Settings

Settings for various operating systems are kept in `~/.dotfiles/settings/`,
they can either be called directly (they are shell scripts), or you can call
them through the install script:
```sh
~/.dotfiles/dotfiles settings linux
```
If the shell alias for the dotfiles is setup, then you can simply call:
```sh
dotfiles settings linux
```

## Backups

Files and Folders to be linked or copied that already exist in the home directory will be backed up to:

```sh
~/.dotfiles/backups/backup-YYYY-MM-DD-HHMMSS
```

Or, disable backups:

```sh
~/.dotfiles/dotfiles --no-backups
```

See "Install Script ENV Vars" below to learn how to set this option by default.

## Useful Things

### ENV Vars

* `DF_SWAY_AUTOSTART`: whether or not to start a sway session when a login on tty1 is started. Default is true
* `DF_TMUX_AUTOSTART`: whether or not to start a tmux session when a terminal is started. Default is false
* `DF_TMUX_AUTOSTART_SESSION_NAME`: The name of the session which will be automatically created or re-attached to. Default is `df_autostart_session`
* `path_prepend` and `path_append`: add to the PATH, should be set in ~/.before, in PATH format
* `DF_ZSH_HIGHLIGHTERS`: set which highlighters to use with zsh-syntax-highlighting. Default is `(main brackets)`

### Install Script ENV Vars
* `DOTFILES_NO_COPIES` set to 1 to disable dotfiles ending in `.copy` from being copied. Default is 0
* `DOTFILES_NO_LINKS` set to 1 to disable dotfiles ending in `.link` or `.hardlink` from being linked. Default is 0
* `DOTFILES_NO_BACKUPS` set to 1 to disable automatic backups of existing files. Default is 0

### Local Override Files

* `~/.gitconfig.local`: Override git settings, useful for setting email and name
* `~/.before`: is sourced near the beginning of `.bash_profile` or `.zshenv`
* `~/.after`: is sourced near the end of `.bash_profile` or `.zshenv`
* `~/.zshenv.local`
* `~/.zshrc.local`
* `~/.zlogin.local`
* `${DOTFILES_DIR}/shell/profile.d/*`: Any shell scripts you place in this directory will be sourced by `${DOTFILES_DIR}/shell/profile`
* `${DOTFILES_DIR}/shell/interactive.d/*`: Any shell scripts you place in this directory will be sourced by `${DOTFILES_DIR}/shell/interactive`
* `~/.config/sway/config.d`: can add extra config files for sway here (may need to create dir)

## Todo
* Add some backup management commands
* Create a manifest on install which can be used for uninstalling dotfiles
