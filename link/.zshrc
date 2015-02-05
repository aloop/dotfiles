. $HOME/.shellconfig/profile

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="afowler"

# Oh My ZSH Plugins to load. If this is already defined, it will use
# that list instead.
if [ ! "${plugins:-}" ]; then
    plugins=(git rvm zsh-syntax-highlighting)
fi

# Start oh-my-zsh
. $ZSH/oh-my-zsh.sh
