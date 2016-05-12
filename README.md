# Dotfiles

## Usage

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

## Todo
* Add some backup management commands
* Create a manifest on install which can be used for uninstalling dotfiles
* Add helper to fill out things such as adding name and email for git in `~/.gitconfig.local`
