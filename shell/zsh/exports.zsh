export HISTFILE="${HOME}/.zsh_history"
export HISTSIZE="10000"
export SAVEHIST="100000"

# Don't show a '%' when the output ends without a newline
export PROMPT_EOL_MARK=""

if [ -n "$DF_ZSH_HIGHLIGHTERS" ]; then
    export ZSH_HIGHLIGHT_HIGHLIGHTERS=${DF_ZSH_HIGHLIGHTERS}
else
    export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
fi
