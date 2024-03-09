if (($+commands[bat])); then
	export MANROFFOPT="-c"
	export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi

export GOPATH=$HOME/prg/go

export TERM=xterm-256color
export EDITOR='nvim'
export VISUAL='nvim'
export GPG_TTY=$(tty)
