if (($+commands[bat])); then
  export MANROFFOPT="-c"
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi

export TERM=xterm-256color
export EDITOR='lvim'
export VISUAL='lvim'
export GPG_TTY=$(tty)
