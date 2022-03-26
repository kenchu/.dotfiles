export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export EDITOR=emacsclient

export EMACS=/Applications/Emacs.app/Contents/MacOS/Emacs

# brew install coreutils
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# doom-emacs bin path
export PATH="$HOME/.emacs.d/bin:$PATH"

# export PATH=$ZPFX/bin:$PATH

# export WORDCHARS="*?_-.[]~=/&;!#$%^(){}<>"
export WORDCHARS="*?._[]~=&;!#$%^(){}<>"

export RUST=cargo
. "$HOME/.cargo/env"
