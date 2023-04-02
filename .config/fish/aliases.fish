alias -s zz='z -'
alias -s md='mkdir -p'
alias -s pg='ps -ef | rg'
alias -s pkill="pkill -9 -f "
alias -s lj='jobs'

alias -s tmux="TERM=xterm-256color command tmux"
alias -s tmx="TERM=xterm-256color command tmux"
alias -s myip='curl ifconfig.co'

alias -s 0ad="$HOME/prg/0ad/binaries/system/pyrogenesis"

# git
alias -s g=git
alias -s gl="git pull --rebase"
alias -s gf="git fetch origin --prune"
alias -s lgcm="git rev-parse --short HEAD"
alias -s cgb="git rev-parse --abbrev-ref HEAD"
alias -s gsud="git switch develop && git pull -r"
alias -s gud="git update-ref refs/heads/develop origin/develop"
alias -s gsb="git switch"
alias -s gbc="git switch -c"
alias -s gm="git merge"
alias -s ga="git add"

if command -sq exa
    alias -s ll="exa --icons -l --group-directories-first"
    alias -s llt="exa --tree --icons -l --group-directories-first"
    alias -s la="exa --icons -la --group-directories-first"
    alias -s lat="exa --tree --icons -la --group-directories-first"
    alias -s l="exa --icons -1a --group-directories-first"
    alias -s lo="la -snew"
    alias -s tree="exa --tree"
end

if command -sq docker-compose
    alias -s dk=docker-compose
    alias -s dku="docker-compose up -d"
    alias -s dkd="docker-compose down"
end

if command -sq podman
    alias -s docker=podman
    alias -s pod=podman
    alias -s pm="podman machine"
    alias -s pmd="podman machine stop"
    alias -s pmu="podman machine start"
end

if command -sq tldr
    alias -s tl='tldr --list | fzf --preview "tldr {1} --color=always" --preview-window=right,68% | xargs tldr'
end

if command -sq cowsay
    alias -s moo='fortune | cowsay'
end

alias -s serve='python3 -m http.server'
alias -s jj='pbpaste | jsonpp | pbcopy'

# Lists the ten most used commands.
alias -s hxstat="history 0 | awk '{print $2}' | sort | uniq -c | sort -n -r | head"

alias -s se='podman run --rm -it -p 4444:4444 -p 7900:7900 -e SE_NODE_MAX_SESSIONS=4 -e SCREEN_WIDTH=1920 -e SCREEN_HEIGHT=1080 --shm-size 3g seleniarm/standalone-chromium:latest'
