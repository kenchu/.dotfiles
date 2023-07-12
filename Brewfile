# tap "homebrew/cask"
tap "homebrew/cask-fonts"

# font
cask "font-jetbrains-mono-nerd-font"

# required
brew "stow"
brew "fish"
brew "fisher"

# Go
brew "direnv"
brew "dive"
brew "fzf"
brew "glow"
brew "jid"
brew "lazygit"
brew "rclone"
brew "yq"

# Rust
brew "bandwhich"
brew "bat"
brew "broot"
brew "chafa"
brew "choose-rust"
brew "exa"
brew "fd"
brew "git-delta"
brew "gitui"
brew "hexyl"
brew "navi"
brew "procs"
brew "ripgrep"
brew "sd"
brew "sk"
brew "starship"
brew "xh"
brew "xplr"
brew "zoxide"
brew "zellij"

# Ruby
brew "lolcat"

# C / C++
brew "figlet"
brew "jq"
brew "lnav"
# brew "goaccess"

# Python
brew "glances"
brew "ansible"

# Shell
brew "asdf"
brew "git-flow-avh"

# cask
cask "iterm2",             greedy: true, args: { "no-quarantine": true }
cask "warp",               greedy: true, args: { "no-quarantine": true }
# cask "firefox",            greedy: true, args: { "no-quarantine": true }
cask "raycast",            greedy: true, args: { "no-quarantine": true }
cask "stats",              greedy: true, args: { "no-quarantine": true }
cask "visual-studio-code", greedy: true, args: { "no-quarantine": true }
cask "notion",             greedy: true, args: { "no-quarantine": true }

# Container tools
cask "docker",             greedy: true, args: { "no-quarantine": true }
brew "lazydocker"
brew "k9s"
# brew "kdash-rs/kdash/kdash"
# brew "kind"

# # cask (optional)
# cask "postman"
# cask "ngrok"
# cask "slack"

# Quick Look Plugins
cask "qlmarkdown",       args: { "no-quarantine": true }
cask "syntax-highlight", args: { "no-quarantine": true }

# doom emacs deps
brew "cmake"
brew "dbus" #, restart_service: true
# cask "jimeh/emacs-builds/emacs-app-good"
tap "d12frosted/emacs-plus"
brew "emacs-plus@30",
    # args: [ "with-dbus", "with-xwidgets", "with-native-comp", "with-poll" ],
    args: [ "with-dbus", "with-xwidgets", "with-native-comp", "with-poll", "with-memeplex-slim-icon" ],
    # restart_service: true,
    link: true

brew "neovim"
