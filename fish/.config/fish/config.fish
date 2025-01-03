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
set -x JAVA_HOME $HOME/.asdf/installs/java/graalvm-22.3.1+java17
# https://github.com/catppuccin/fzf
set -x FZF_DEFAULT_OPTS "\
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"

# set fish_user_paths
fish_add_path $HOME/.asdf/shims
# fish_add_path $HOME/.docker/bin
# fish_add_path $HOME/.anyenv/bin
fish_add_path $XDG_CONFIG_HOME/emacs/bin
# fish_add_path (go env GOPATH)/bin

# abbr -a emacs emacsclient -nw
abbr -a ldk lazydocker
abbr -a lgit lazygit
# abbr -a nv neovide

function nv
    # Assumes all configs exist in directories named ~/.config/nvim-*
    set -l config (fd --max-depth 1 --glob 'nvim-*' ~/.config | fzf --prompt="Neovim Configs > " --height=~50% --layout=reverse --border --exit-0)

    # If I exit fzf without selecting a config, don't open Neovim
    if test -z "$config"
        echo "No config selected"
        return
    end

    # Open Neovim with the selected config
    set -l NVIM_APPNAME (basename $config)
    NVIM_APPNAME=$NVIM_APPNAME nvim $argv
end
