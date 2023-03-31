export HISTFILE="${XDG_STATE_HOME}/zsh/history"
export HISTSIZE="10000"
export SAVEHIST="100000"

# Don't show a '%' when the output ends without a newline
export PROMPT_EOL_MARK=""

if [ -n "$DF_ZSH_HIGHLIGHTERS" ]; then
    export ZSH_HIGHLIGHT_HIGHLIGHTERS=${DF_ZSH_HIGHLIGHTERS}
else
    export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
fi

TIMEFMT=$'\nreal\t%*E\nuser\t%*U\nsys\t%*S\nmaxmem\t%M MB\nfaults\t%F'

