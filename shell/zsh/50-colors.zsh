# I'm using 24bit color definitions for my prompt, so we may need this for terminals that don't support those definitions.
if [[ ! $COLORTERM = *(24bit|truecolor)* ]]; then
    zmodload zsh/nearcolor
fi
