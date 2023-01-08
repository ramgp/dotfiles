set -q XDG_CACHE_HOME || set -U XDG_CACHE_HOME $HOME/.cache
set -q XDG_CONFIG_HOME || set -U XDG_CONFIG_HOME $HOME/.config
set -q XDG_DATA_HOME || set -U XDG_DATA_HOME $HOME/.local/share

set -gx FZF_DEFAULT_COMMAND 'rg --hidden --ignore .git -g ""'

set -g theme_date_format "+%H:%M %a %m/%d"

set -gx EDITOR lvim
set -gx VISUAL lvim

if status --is-interactive
  fish_vi_key_bindings

  eval (/opt/homebrew/bin/brew shellenv)

  fish_add_path -Pmp $HOME/.cargo/bin /opt/homebrew/opt/curl/bin
  fish_add_path -Pa $HOME/.local/bin /usr/local/bin 

  set -Ux PYENV_ROOT $HOME/.pyenv
  set -gx N_PREFIX $HOME/.local/n
  set -gx PNPM_HOME $XDG_DATA_HOME/pnpm

  fish_add_path -Pa $PYENV_ROOT/bin $HOME/.dotfiles/bin $N_PREFIX/bin $XDG_DATA_HOME/pnpm

  set aliases $XDG_CONFIG_HOME/fish/aliases.fish
  test -r $aliases && source $aliases 1> /dev/null

  set r1_aliases $HOME/.r1_aliases.fish
  test -r $r1_aliases && source $r1_aliases 1> /dev/null

  function multicd
    echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
  end

  abbr --add dotdot --regex '^\.\.+$' --function multicd

  set -g theme_color_scheme dark 

  set theme $XDG_CONFIG_HOME/fish/themes/kanagawa.fish
  test -r $theme; and source $theme

  zoxide init fish | source
end

