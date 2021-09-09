# set fish_user_paths
fish_add_path /Applications/Emacs.app/Contents/MacOS
fish_add_path $HOME/.emacs.d/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.pyenv/bin

fish_vi_key_bindings

# set environment variables
set -x XDG_CONFIG_HOME $HOME/.config
# set -gx EMACS /Applications/Emacs.app/Contents/MacOS/bin

# https://github.com/PatrickF1/fzf.fish/wiki/Migration-Guides#v7
fzf_configure_bindings --directory=\cf

if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
    direnv hook fish | source
    pyenv init --path | source
    pyenv init - | source
end
