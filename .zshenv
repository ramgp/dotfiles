export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:=${HOME}/.config}
export XDG_DATA_HOME=${XDG_DATA_HOME:=${HOME}/.local/share}
export ZDOTDIR=${ZDOTDIR:=${XDG_CONFIG_HOME}/zsh}

export RBENV_ROOT="${XDG_DATA_HOME}/rbenv"

source $ZDOTDIR/.zshenv
