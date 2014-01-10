# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="agnoster"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git rvm zsh-syntax-highlighting)

# We source this before oh-my-zsh so that various oh-my-zsh settings can be
# overridden per-system
. $HOME/.profile

# Start oh-my-zsh
. $ZSH/oh-my-zsh.sh
