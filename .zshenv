export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:=${HOME}/.config}
export XDG_DATA_HOME=${XDG_DATA_HOME:=${HOME}/.local/share}
export ZDOTDIR=${ZDOTDIR:=${XDG_CONFIG_HOME}/zsh}

export RBENV_ROOT="${XDG_DATA_HOME}/rbenv"

# Get color support for 'less'
export LESS="--RAW-CONTROL-CHARS"

# Use colors for less, man, etc.
[ -f ~/.LESS_TERMCAP ] && . ~/.LESS_TERMCAP

source $ZDOTDIR/.zshenv
