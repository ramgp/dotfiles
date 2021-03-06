set -g -x PATH $HOME/.local/bin $PATHTH /usr/local/bin $PATH
set -g -x PATH $HOME/opt/syncthing $PATH
set -g -x PATH $HOME/opt/scripts $PATH
set -g theme_date_format "+%H:%M %a %m/%d"
set -g theme_color_scheme dark 
set -g theme_color_scheme tomorrow-night 

# Base16 Shell
if status --is-interactive
  eval sh $HOME/.config/base16-shell/scripts/base16-tomorrow-night.sh
end

alias -="cd -"
alias ws="$HOME/dev/tools/WebStorm/bin/webstorm.sh"
alias aup="sudo apt update ;and sudo apt dist-upgrade"
alias ains="sudo apt install $argv"
alias aclean="echo 'Cleaning up' ;and sudo apt install -f ;and sudo apt autoremove ;and sudo apt autoclean -y ;and sudo apt clean -y"

bass source ~/.nvm/nvm.sh --no-use \; nvm
rvm default
