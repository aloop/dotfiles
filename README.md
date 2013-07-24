# Dotfile Management

Just a way to manage my dotfiles

## Install

1. Clone the repository and pull in any the submodules:

        git clone --recursive https://github.com/aloop/dotfiles.git ~/.dotfiles

2. And then make the install script executable and run it

        chmod +x ~/.dotfiles/manage.py
        ~/.dotfiles/manage.py install

## Backups

Files and Folders to be linked or copied that already exist in the home directory will be backed up to:


    ~/.dotfiles/backups/HOSTNAME@YYYY-MM-DD-HHMMSS


This behavior can be disabled at runtime with the `--no-backup` flag.

## Basic Usage

To update all links and copies, simply run the install script again:

    ~/.dotfiles/manage.py install

On the other hand, you may wish to only update links *or* copies:

    ~/.dotfiles/manage.py link
    
or:
   
    ~/.dotfiles/manage.py copy 

Certain files or folders can be excluded from being linked or copied individually like so:

    ~/.dotfiles/manage.py install --ignore FILENAME FOLDERNAME …

Currently globs in these names are **not** supported.

## Notes
* I have only used this script with python versions 2.7 and 3.3 (OSX 10.8 native and via homebrew, and Ubuntu 13.04 server)
* It should be possible to use this script in just about any directory, i've only tested it at ~/.dotfiles, however.
* This is the first python script i've ever written, beware of gremlins!

## Author

[Anthony Loop](https://github.com/aloop)
