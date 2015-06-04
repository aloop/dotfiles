# Dotfile Management

Just a way to manage my dotfiles

## Install

1. Clone the repository:

        git clone https://github.com/aloop/dotfiles.git ~/.dotfiles

2. And then run the install script

        ~/.dotfiles/manage install

## Backups

Files and Folders to be linked or copied that already exist in the home directory will be backed up to:


    ~/.dotfiles/backups/HOSTNAME@YYYY-MM-DD-HHMMSS


## Basic Usage

To update all links and copies, simply run the install script again:

    ~/.dotfiles/manage install

On the other hand, you may wish to only update links *or* copies:

    ~/.dotfiles/manage link

or:

    ~/.dotfiles/manage copy


## Notes
* It should be possible to use this script in just about any directory, i've only tested it at ~/.dotfiles, however.


## Todo
* Add some backup management commands
* Add `--no-backup` flag to disable backups
* Add `--exlude` flag, to exlude files (and folders?) from being linked/copied
* Maybe action-specific flags, such as `--exclude-link` or `--exclude-copy`
* Add helper to fill out things such as a local `~/.gitconfig-custom` Containing proper credentials
* Support Merged short options, such as `-nf` parse to no-backup and force, for example
