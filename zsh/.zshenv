export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export EDITOR=emacsclient

# brew install coreutils
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

alias doom=$HOME/.doom-emacs/bin/doom

