abbr -a zz 'z -'
abbr -a md 'mkdir -p'
abbr -a pg 'ps -ef | rg'
abbr -a pkill "pkill -9 -f "
abbr -a lj jobs
abbr -a - cd -
abbr -a v nvim
abbr -a rd rm -rf

alias -s tmux "TERM=xterm-256color command tmux"
abbr -a myip 'curl ifconfig.co'

alias -s 0ad "$HOME/prg/0ad/binaries/system/pyrogenesis"

# git
abbr -a g git
abbr -a gl "git pull --rebase"
abbr -a gf "git fetch origin --prune"
abbr -a gh "git rev-parse --short=8 HEAD"
abbr -a gsud "git switch develop && git pull -r"
abbr -a gud "git update-ref refs/heads/develop origin/develop"
alias -s gsb "git switch"
alias -s gbc "git switch -c"
abbr -a gm "git merge"
abbr -a ga "git add"

if command -sq eza
    set -l ignore_globs "'.git|.DS_Store'"
    set -l D1 --group-directories-first

    alias -s l "eza --icons -1a $D1 -I $ignore_globs"
    alias -s ll "eza --icons -l $D1 --no-permissions --no-user"
    alias -s la "ll -a -I $ignore_globs"
    alias -s lo "la -snew"
    alias -s tree "eza -a --icons --tree $D1 -I $ignore_globs"
end

if command -sq docker-compose
    abbr -a dk docker-compose
    abbr -a dku "docker-compose up -d"
    abbr -a dkd "docker-compose down"
end

if command -sq podman
    abbr -a pod podman
    abbr -a pm "podman machine"
    abbr -a pmd "podman machine stop"
    abbr -a pmu "podman machine start"
end

if command -sq docker
    alias -s se 'docker run --rm -it -p 4444:4444 -p 7900:7900 -e SE_NODE_MAX_SESSIONS=4 -e SCREEN_WIDTH=1920 -e SCREEN_HEIGHT=1080 --shm-size 3g seleniarm/standalone-chromium:latest'
end

if command -sq tldr
    alias -s tl 'tldr --list | fzf --preview "tldr {1} --color=always" --preview-window=right,68% | xargs tldr'
end

if command -sq cowsay
    abbr -a moo 'fortune | cowsay'
end

abbr -a serve 'python3 -m http.server'
abbr -a jj 'pbpaste | jsonpp | pbcopy'

# Lists the ten most used commands.
alias -s hxstat "history 0 | awk '{print $2}' | sort | uniq -c | sort -n -r | head"
