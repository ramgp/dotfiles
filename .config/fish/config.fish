set -q XDG_CACHE_HOME || set -U XDG_CACHE_HOME $HOME/.cache
set -q XDG_CONFIG_HOME || set -U XDG_CONFIG_HOME $HOME/.config
set -q XDG_DATA_HOME || set -U XDG_DATA_HOME $HOME/.local/share
set -q XDG_STATE_HOME || set -U XDG_STATE_HOME $HOME/.local/state

set -gx FZF_DEFAULT_COMMAND 'rg --hidden --ignore .git -g ""'

set -g theme_date_format "+%H:%M %a %m/%d"

set -gx SUDO_EDITOR nvim
set -gx EDITOR nvim
set -gx VISUAL nvim

set -q GOPATH || set -gx GOPATH $HOME/prg/go

set -x MANPAGER "NVIM_APPNAME=nvman nvim +Man!"

if status --is-interactive
    set fzf_fd_opts --hidden --max-depth 5

    eval (/opt/homebrew/bin/brew shellenv)

    fish_add_path -Pmp $HOME/.cargo/bin /opt/homebrew/opt/ncurses/bin /opt/homebrew/opt/curl/bin
    fish_add_path -Pa $HOME/.local/bin /usr/local/bin $HOME/.local/share/bob/nvim-bin $GOPATH/bin

    set -Ux PYENV_ROOT $HOME/.pyenv
    set -gx N_PREFIX $HOME/.local/n
    set -gx PNPM_HOME $XDG_DATA_HOME/pnpm

    fish_add_path -Pa $PYENV_ROOT/bin $HOME/.dotfiles/bin $N_PREFIX/bin $XDG_DATA_HOME/pnpm

    source $HOME/.dotfiles/.config/fish/functions/fish_title.fish

    if not functions -q nv
        alias -s nv 'NVIM_APPNAME=launch_nvim nvim' 2>/dev/null
    end

    set -g fish_user_abbreviations

    set aliases $HOME/.dotfiles/.config/fish/aliases.fish
    test -r $aliases && source $aliases 1>/dev/null

    set r1_aliases $HOME/.r1_aliases.fish
    test -r $r1_aliases && source $r1_aliases 1>/dev/null

    function multicd
        echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
    end

    abbr --add dotdot --regex '^\.\.+$' --function multicd

    function bind_bang
        switch (commandline -t)[-1]
            case "!"
                commandline -t -- $history[1]
                commandline -f repaint
            case "*"
                commandline -i !
        end
    end

    function bind_dollar
        switch (commandline -t)[-1]
            case "!"
                commandline -f backward-delete-char history-token-search-backward
            case "*"
                commandline -i '$'
        end
    end

    fish_vi_key_bindings
    bind -M insert ! bind_bang
    bind -M insert '$' bind_dollar

    bind -M default ^ beginning-of-line
    bind -M insert \ce end-of-line
    bind -M insert \ca beginning-of-line
    bind -M insert \e\[A history-prefix-search-backward
    bind -M insert \e\[B history-prefix-search-forward

    #fzf_configure_bindings --directory=\cf

    atuin init fish | source

    zoxide init fish | source

    function starship_transient_prompt_func
        starship module custom.time
        starship module fill
        # starship module character
    end

    function starship_transient_rprompt_func
        starship module status
    end

    starship init fish | source
    enable_transience
end
