# Vim config

## Introduction
I made this configuration for myself, don't expect it to work exactly as you would like it to.

## Requirements
* Git
* A recent version of vim (7.4+ preferred)

**NOTE:** on vim versions 7.3 and below, vim does not check `~/.vim` for a `vimrc`, in the case that you are running an older vim you may choose to link `~/.vim/vimrc` to `~/.vimrc`.

Alternatively, you may set the environment variable $VIMINIT like so: `export VIMINIT=":so ~/.vim/vimrc"`

## Local Configuration
There are three files where the configuration can be overridden

* `~/.vim/before.vim` is sourced immediately before all other configuration files are loaded
* `~/.vim/local-plugins.vim` is sourced after all other plugins are defined to allow custom plugins to be specified
* `~/.vim/after.vim` is sourced at the end of `~/.vim/vimrc`

## Plugin Setup
### First Launch Notes
The first time you launch vim after downloading this configuration, it will attempt to automatically install the plugin manager and all the plugins defined in `~/.vim/config/plugins.vim` or `~/.vim/local-plugins.vim`.
