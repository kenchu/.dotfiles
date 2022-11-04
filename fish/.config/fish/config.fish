# https://fishshell.com/docs/current/language.html
set -x fish_features ampersand-nobg-in-token qmark-noglob

# set environment variables
# https://www.reddit.com/r/fishshell/comments/govh0k/recommended_way_of_setting_environment_vars_in/
set -x XDG_CONFIG_HOME $HOME/.config
set -x GOPATH $HOME/go
set -x JAVA_HOME $HOME/.asdf/installs/java/microsoft-17.0.5

# set fish_user_paths
# fish_add_path /usr/local/bin
fish_add_path /usr/local/opt/uutils-coreutils/libexec/uubin
fish_add_path $XDG_CONFIG_HOME/emacs/bin
fish_add_path $HOME/.anyenv/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $GOPATH/bin

# https://github.com/jimeh/emacs-builds
if test -d /Applications/Emacs.app/Contents/MacOS/bin
    fish_add_path /Applications/Emacs.app/Contents/MacOS/bin
    alias emacs="emacsclient -nw"
end

fish_vi_key_bindings

# https://github.com/PatrickF1/fzf.fish/wiki/Migration-Guides#v7
if type -q fzf_configure_bindings
    fzf_configure_bindings --directory=\cf
end

if not set -q fifc_keybinding
    set -Ux fifc_keybinding \ct
    set -S fifc_keybinding # show variable
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
    zoxide init fish | source
    navi widget fish | source
    # source (nodenv init -|psub)
end

# pyenv
# status is-login; and pyenv init --path | source
# status is-interactive; and pyenv init - | source
