alias pg='ps -ef | rg'
alias pkill="pkill -9 -f "
alias lj='jobs'

alias reload=". $ZDOTDIR/.zshrc"
alias vi="nvim"
alias v="nvim"

alias timezsh="time zsh -i -c echo"

alias tmux='TERM=xterm-256color tmux -f "$XDG_CONFIG_HOME"/tmux/.tmux.conf'
alias tmx='TERM=xterm-256color /usr/bin/tmux -f "$HOME"/.dotfiles/.tmux.conf'
alias ws="$HOME/prg/tools/WebStorm/bin/webstorm.sh nosplash"
alias myip='curl ifconfig.co'

# git
alias gl="git pull --rebase"
alias gf="git fetch origin"
alias lgcm="git rev-parse --short HEAD"
alias cgb="git rev-parse --abbrev-ref HEAD"
alias gsud="git switch develop && git pull -r"
alias gud="git update-ref refs/heads/develop origin/develop"
alias gsb="git switch"

if (( $+commands[exa] )); then
  alias ll="exa --icons -l --group-directories-first"
  alias llt="exa --tree --icons -l --group-directories-first"
  alias la="exa --icons -la --group-directories-first"
  alias lat="exa --tree --icons -la --group-directories-first"
  alias l="exa --icons -1a --group-directories-first"
  alias lo="la -snew"
fi

if (( $+commands[docker-compose] )); then
  alias dk=docker-compose
  alias dku="docker-compose up -d"
  alias dkd="docker-compose down"
fi
