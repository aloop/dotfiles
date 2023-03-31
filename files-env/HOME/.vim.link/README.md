# Vim config

## Introduction
I made this configuration for myself, don't expect it to work exactly as you would like it to.

## Requirements
* Git (for plugin installation)

## Local Configuration
There are three files where the configuration can be overridden

The paths starting with `~/.vim/` below will be different when using neovim,
they will start with `${XDG_CONFIG_HOME}/nvim/` instead.

* `~/.vim/before.vim` is sourced immediately before all other configuration files are loaded
* `~/.vim/plugins.local.vim` is sourced after all other plugins are defined to allow custom plugins to be specified
* `~/.vim/after.vim` is sourced at the end of `~/.vim/vimrc`

## Plugin Setup
### First Launch Notes
The first time you launch vim after downloading this configuration, it will attempt to automatically install the plugin manager and all the plugins defined in `~/.vim/config/plugins.vim` and `~/.vim/plugins.local.vim` (neovim path is slightly different, `${XDG_CONFIG_HOME}/nvim/plugins.vim` and `${XDG_CONFIG_HOME}/nvim/plugins.local.vim` respectively).

### Plugin installation dir

For vim it's `${XDG_DATA_HOME}/vim/plugged`, for neovim it's `${XDG_DATA_HOME}/nvim/plugged
