# ----------------
# Productive Tools
# ----------------

# fast-syntax-highlighting, zsh-completions, zsh-autosuggestions
zinit wait lucid for \
      atinit="ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
      zdharma/fast-syntax-highlighting \
      blockf \
      zsh-users/zsh-completions \
      atload="!_zsh_autosuggest_start" \
      zsh-users/zsh-autosuggestions

zinit for zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# zaw, zsh-autopair
zinit wait lucid for \
      zsh-users/zaw \
      hlissner/zsh-autopair

# fasd
zinit wait lucid for \
      make="PREFIX=$ZPFX install" \
      sbin="fasd" clvv/fasd \
      svn OMZP::fasd

# fzf, fzy, fzf-marks
zinit pack="bgn+keys" git for fzf
# zinit pack="bgn" git for fzy
zinit wait lucid for \
      urbainvaes/fzf-marks \
      svn OMZP::zsh-interactive-cd

# bat, delta, exa, fd, hexyl, rg, procs, jq, editorconfig
zinit wait="1" lucid from="gh-r" as="null" for \
      sbin="**/bat"       @sharkdp/bat \
      sbin="**/delta"     dandavison/delta \
      sbin="**/exa"       ogham/exa \
      sbin="**/fd"        @sharkdp/fd \
      sbin="**/hexyl"     @sharkdp/hexyl \
      sbin="**/rg"        BurntSushi/ripgrep \
      sbin="**/procs"     dalance/procs \
      sbin="jq* -> jq"    stedolan/jq \
      sbin="**/editorconfig" editorconfig/editorconfig-core-go

# exa alias
# zinit for DarrinTisdale/zsh-aliases-exa

# zinit as="program" make="!" atclone="./direnv hook zsh > zhook.zsh" \
#       atpull="%atclone" pick="direnv" src="zhook.zsh" for \
#       direnv/direnv

zinit from="gh-r" as="program" mv="direnv* -> direnv" \
      atclone="./direnv hook zsh > zhook.zsh" atpull="%atclone" \
      pick="direnv" src="zhook.zsh" for \
      direnv/direnv

zinit svn for \
      PZTM::utility \
      PZTM::completion \
      PZTM::directory \
      PZTM::git \
      PZTM::osx \
      PZTM::homebrew \
      OMZP::tmux

zinit wait="1" lucid svn for \
      OMZP::colored-man-pages \
      OMZP::urltools

# Container Tools
zinit wait="1" lucid svn for \
      PZTM::docker \
      OMZP::docker-compose \
      OMZP::kubectl

# applications
zinit wait="1" lucid svn for \
      OMZP::forklift

zinit autoload'#manydots-magic' for knu/zsh-manydots-magic

zinit ice as"completion"
zinit snippet https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker

zinit ice as"completion"
zinit snippet https://github.com/ogham/exa/blob/master/completions/completions.zsh

zinit ice as"completion"
zinit snippet https://github.com/sharkdp/fd/blob/master/contrib/completion/_fd

zinit ice as"completion"
zinit snippet https://github.com/BurntSushi/ripgrep/blob/master/complete/_rg

# -----------------------------
# programming languages related
# -----------------------------

zinit wait="1" svn for \
      PZTM::python \
      PZTM::ruby \
      PZTM::node

# Installation of Rust compiler environment via the z-a-rust annex
zinit wait lucid as="null" id-as="rust" sbin="bin/*" rustup \
      atload="[[ ! -f ${ZINIT[COMPLETIONS_DIR]}/_cargo ]] \
                 && zi creinstall -q rust; \
                 export CARGO_HOME=\$PWD; \
                 export RUSTUP_HOME=\$PWD/rustup" for \
      zdharma/null

# nvm, rvm, pyenv, pipenv
zinit wait pack="bgn" git for pyenv
# zinit pack param="GEM → colorls" for any-gem
# zinit pack param="MOD → prettier" for any-node


# -----------------------
# zsh powerlevel10k theme
# -----------------------

# zinit ice depth=1; zinit light romkatv/powerlevel10k

# Load within zshrc – for the instant prompt
# zinit ice nocd lucid atload='!source ~/.p10k.zsh'
# zinit load romkatv/powerlevel10k
