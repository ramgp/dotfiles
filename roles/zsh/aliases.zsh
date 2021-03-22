alias pg='ps -ef | rg'
alias pkill="pkill -9 -f "
alias lj='jobs'

alias reload=". $ZDOTDIR/.zshrc"
alias vi="nvim"
alias v="nvim"

alias timezsh="time zsh -i -c echo"

alias tmux='TERM=xterm-256color tmux -f "$XDG_CONFIG_HOME"/tmux/.tmux.conf'
alias tmx='TERM=xterm-256color /usr/bin/tmux -f "$HOME"/.dotfiles/.tmux.conf'
alias ws="$HOME/prg/tools/WebStorm/bin/webstorm.sh"
alias gl="git pull --rebase"
alias gf="git fetch origin"
alias z="fasd_cd -d"
alias myip='curl ifconfig.co'
alias lgcm="git rev-parse --short HEAD"

if (( $+commands[exa] )); then
  alias ll="exa --icons -l --group-directories-first"
  alias la="ll -a"
  alias l="exa --icons -1a --group-directories-first"
  alias lo="la -snew"
fi
