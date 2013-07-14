# Simple Dotfile Management

Just a fairly simple way to manage my dotfiles

## Install

1. Clone the repository and pull in all the submodules:

   ```
   git clone --recursive https://github.com/aloop/dotfiles.git ~/.dotfiles
   ```

2. And then run the install script (Make sure the default python interpreter is python 2)

   ```
   python ~/.dotfiles/install.py
   ```

### Notes
* I have not tested install.py with python 3, and I don't expect it would work.
* It should be possible to clone this repo to just about any location, however
  i've only tested it at ~/.dotfiles myself.
* This is the first python script i've ever written, so a gremlin infestation is likely.
* And on that last note, i'm not responsible if this eats your directory contents. It hasn't been so unkind to me however.

Files/Folders to be linked/copied that already exist in the home directory will be moved to:

```
~/.dotfiles/backups/HOSTNAME@YYYY-MM-DD-HHMMSS
```

## Usage

To re-link or add new links, simply run the install script again:

```
python ~/.dotfiles/install.py
```

## Author

[Anthony Loop](https://github.com/aloop)
