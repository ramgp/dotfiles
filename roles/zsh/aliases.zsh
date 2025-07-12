# https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/directories.zsh
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

alias -g ..='cd ..'
alias -g ...='cd ../..'
alias -g ....='cd ../../..'
alias -g .....='cd ../../../..'
alias -g ......='cd ../../../../..'

alias -- -='cd -'
alias 1='cd -1'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

function td() {
  mkdir -p $@ && cd ${@:$#}
}

alias md='mkdir -p'
alias rd='rm -rf'

function d () {
  if [[ -n $1 ]]; then
    dirs "$@"
  else
    dirs -v | head -n 10
  fi
}
# directories

alias ~='cd ~'
alias /='cd /'
alias zz='z -'

alias pg='ps -ef | rg'
alias pkill="pkill -9 -f "
alias lj='jobs'

alias s="source $XDG_CONFIG_HOME/zsh/.zshrc"
alias vi="nvim"
alias v="nvim"

alias timezsh="time zsh -i -c echo"

alias tmux='TERM=xterm-256color tmux -f "$XDG_CONFIG_HOME"/tmux/.tmux.conf'
alias tmx='TERM=xterm-256color command tmux -f "$HOME"/.tmux.conf'
alias ws="$HOME/prg/tools/WebStorm/bin/webstorm.sh nosplash"
alias myip='curl ifconfig.co'

alias 0ad="$HOME/prg/0ad/binaries/system/pyrogenesis"

# git
alias g=git
alias gp="git pull"
alias gu="git push"
alias gf="git fetch origin"
alias lgcm="git rev-parse --short HEAD"
alias cgb="git rev-parse --abbrev-ref HEAD"
alias gsud="git switch develop && git pull -r"
alias gud="git update-ref refs/heads/develop origin/develop"
alias gsb="git switch"

if (( $+commands[eza] )); then
  ignore_globs="'.git|.DS_Store'"
  D1=--group-directories-first

  alias l="eza --icons -1a $D1 -I $ignore_globs"
  alias ll="eza --icons -l $D1 --no-permissions --no-user"
  alias la="ll -a -I $ignore_globs"
  alias lo="la -snew"
  alias tree="eza -a --icons --tree $D1 -I $ignore_globs"
fi

if (( $+commands[docker] )); then
    alias se='docker run --rm -it -p 4444:4444 -p 7900:7900 -e SE_NODE_MAX_SESSIONS=4 -e SCREEN_WIDTH=1920 -e SCREEN_HEIGHT=1080 --shm-size 3g seleniarm/standalone-chromium:latest'
fi

if (( $+commands[docker-compose] )); then
  alias dk=docker-compose
  alias dku="docker-compose up -d"
  alias dkd="docker-compose down"
fi

if (( $+commands[podman] )); then
  alias docker=podman
  alias pod=podman
  alias pm="podman machine"
  alias pmd="podman machine stop"
  alias pmu="podman machine start"
  alias se='podman run --rm -it -p 4444:4444 -p 7900:7900 -e SE_NODE_MAX_SESSIONS=4 -e SCREEN_WIDTH=1920 -e SCREEN_HEIGHT=1080 --shm-size 3g seleniarm/standalone-chromium:latest'
fi

alias serve='python3 -m http.server'

if [[ $(uname) == "Darwin" ]]; then
  alias jj='pbpaste | jsonpp | pbcopy'
fi

# Lists the ten most used commands.
alias hxstat="history 0 | awk '{print $2}' | sort | uniq -c | sort -n -r | head"

