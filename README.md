# Simple Dotfile Management

Just a simple way to manage dotfiles, very derivative, i'm sure.

I Wrote **dotfiles.sh** in a few minutes, so there are likely some oversights, although in my minimal testing it seems fine.

## Install

Simply clone the repository and run the script:

```sh
git clone --recursive https://github.com/aloop/dotfiles.git ~/.dotfiles
bash ~/.dotfiles/dotfiles.sh
```

Files/Folders to be linked/copied that already exist in the home dir will be moved to:
```sh
~/.dotfiles/backups/HOSTNAME@YYYY-MM-DD-HHMM
```

## Usage

To re-link or add new links, simply run dotfiles.sh again:

```sh
bash ~/.dotfiles/dotfiles.sh
```

## Author

[Anthony Loop](https://github.com/aloop)
