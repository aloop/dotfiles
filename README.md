# Dotfiles

## Installation

Clone the repository:

```sh
git clone https://github.com/aloop/dotfiles.git ~/.dotfiles
```

To install or update all links and copies, simply run the following command:

```sh
~/.dotfiles/install
```

On the other hand, you may wish to only update links *or* copies:

```sh
~/.dotfiles/install --no-copies # Only install links
```

or:

```sh
~/.dotfiles/install --no-links # Only install copies
```

## Backups

Files and Folders to be linked or copied that already exist in the home directory will be backed up to:

```sh
~/.dotfiles/backups/backup-YYYY-MM-DD-HHMMSS
```

Or, disable backups:

```sh
~/.dotfiles/install --no-backups
```

## Useful things

### ENV vars

* `DF_TMUX_AUTOSTART`: whether or not to start a tmux session when a terminal is started. Default is false
* `DF_TMUX_AUTOSTART_SESSION_NAME`: The name of the session which will be automatically created or re-attached to. Default is `df_autostart_session`
* `path_prepend` and `path_append`: add to the PATH, should be set in ~/.before, in PATH format
* `DF_ZSH_HIGHLIGHTERS`: set which highlighters to use with zsh-syntax-highlighting. Default is `(main brackets)`

### Local Override Files

* `~/.gitconfig.local`: Override git settings, useful for setting email and name
* `~/.before`: is sourced near the beginning of `files/.shell-config/profile`
* `~/.after`: is sourced near the end of `files/.shell-config/profile`
* `~/.zshenv.local`
* `~/.zshrc.local`
* `~/.shell-config/profile.d/*`: Any shell scripts you place in this directory will be sourced by `~/.shell-config/profile`
* `~/.shell-config/interactive.d/*`: Any shell scripts you place in this directory will be sourced by `~/.shell-config/interactive`

## Todo
* Create a bashrc, and probably configs for other shells too.
* Add some backup management commands
* Create a manifest on install which can be used for uninstalling dotfiles
* Add helper to fill out things such as adding name and email for git in `~/.gitconfig.local`
