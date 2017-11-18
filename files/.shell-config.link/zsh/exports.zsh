export HISTFILE="$HOME/.zsh_history"
export HISTSIZE="1000"
export SAVEHIST="10000"

# Don't show a '%' when the output ends without a newline
export PROMPT_EOL_MARK=""

if [ ! -z "${DF_ZSH_HIGHLIGHTERS}" ]; then
    ZSH_HIGHLIGHT_HIGHLIGHTERS=${DF_ZSH_HIGHLIGHTERS}
else
    ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
fi
