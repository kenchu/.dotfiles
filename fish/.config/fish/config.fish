# set fish_user_paths
fish_add_path /usr/local/bin
fish_add_path /Applications/Emacs.app/Contents/MacOS
fish_add_path $HOME/.emacs.d/bin
fish_add_path $HOME/.asdf/shims
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.pyenv/bin

fish_vi_key_bindings

# set environment variables
set -x XDG_CONFIG_HOME $HOME/.config

# with both ampersand-nobg-in-token and qmark-noglob, this argument has no special characters anymore
set -Ux fish_features ampersand-nobg-in-token qmark-noglob

# set -gx EMACS /Applications/Emacs.app/Contents/MacOS/bin

# https://github.com/PatrickF1/fzf.fish/wiki/Migration-Guides#v7
fzf_configure_bindings --directory=\cf

if status is-interactive
    # Commands to run in interactive sessions can go here
    thefuck --alias | source
    starship init fish | source
    zoxide init fish | source
    direnv hook fish | source
    source /usr/local/opt/asdf/libexec/asdf.fish
end

# pyenv
# status is-login; and pyenv init --path | source
# status is-interactive; and pyenv init - | source
