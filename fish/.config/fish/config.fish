# with both ampersand-nobg-in-token and qmark-noglob, this argument has no special characters anymore
set -x fish_features ampersand-nobg-in-token qmark-noglob

# set environment variables
# https://www.reddit.com/r/fishshell/comments/govh0k/recommended_way_of_setting_environment_vars_in/
set -x XDG_CONFIG_HOME $HOME/.config
set -x GOPATH $HOME/go
set -x JAVA_HOME $HOME/.asdf/installs/java/microsoft-17.0.4

# set fish_user_paths
# fish_add_path /usr/local/bin
fish_add_path $GOPATH/bin
fish_add_path $HOME/.emacs.d/bin
fish_add_path $HOME/.anyenv/bin
fish_add_path $HOME/.cargo/bin

# https://github.com/jimeh/emacs-builds
if test -d /Applications/Emacs.app/Contents/MacOS/bin
    fish_add_path /Applications/Emacs.app/Contents/MacOS/bin
    alias emacs="emacsclient -nw"
end

fish_vi_key_bindings

# https://github.com/PatrickF1/fzf.fish/wiki/Migration-Guides#v7
fzf_configure_bindings --directory=\cf

if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
    zoxide init fish | source
    navi widget fish | source
end

# pyenv
# status is-login; and pyenv init --path | source
# status is-interactive; and pyenv init - | source
