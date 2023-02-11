# https://fishshell.com/docs/current/language.html
set fish_features ampersand-nobg-in-token qmark-noglob
# https://stackoverflow.com/questions/48956984/how-to-remap-escape-insert-mode-to-jk-in-fish-shell
set fish_key_bindings fish_user_key_bindings
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
    # source (/opt/homebrew/bin/brew shellenv -|psub)
    # fish_add_path -U $HOMEBREW_PREFIX/bin
    starship init fish | source
    zoxide init fish | source
    navi widget fish | source
    # source (nodenv init -|psub)
end

# pyenv
# status is-login; and pyenv init --path | source
# status is-interactive; and pyenv init - | source

test -e $HOME/.iterm2_shell_integration.fish; and source $HOME/.iterm2_shell_integration.fish

# https://www.reddit.com/r/fishshell/comments/govh0k/recommended_way_of_setting_environment_vars_in/
set -x LANG en_US.UTF-8
set -x XDG_CONFIG_HOME $HOME/.config
set -x JAVA_HOME $HOME/.asdf/installs/java/microsoft-17.0.6

# set fish_user_paths
fish_add_path $HOME/.anyenv/bin
fish_add_path $XDG_CONFIG_HOME/emacs/bin

abbr -a emacs emacsclient -nw
