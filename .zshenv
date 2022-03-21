export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:=${HOME}/.config}
export XDG_DATA_HOME=${XDG_DATA_HOME:=${HOME}/.local/share}

export ZDOTDIR=${ZDOTDIR:=${XDG_CONFIG_HOME}/zsh}

# zinit
declare -A ZINIT
ZINIT[HOME_DIR]="$ZDOTDIR"/.zinit
ZINIT[BIN_DIR]="$ZDOTDIR"/.zinit/bin
ZINIT[PLUGINS_DIR]="$ZDOTDIR"/.zinit/plugins
ZINIT[COMPLETIONS_DIR]="$ZDOTDIR"/.zinit/completions
ZINIT[SNIPPETS_DIR]="$ZDOTDIR"/.zinit/snippets
ZINIT[ZCOMPDUMP_PATH]="$XDG_CACHE_HOME"/zcompdump/zcompdump-zinit

export RBENV_ROOT="${XDG_DATA_HOME}/rbenv"

# Get color support for 'less'
export LESS="--RAW-CONTROL-CHARS"

# Use colors for less, man, etc.
[ -f ~/.LESS_TERMCAP ] && . ~/.LESS_TERMCAP

[ -f $ZDOTDIR/.zshenv ] && . $ZDOTDIR/.zshenv

