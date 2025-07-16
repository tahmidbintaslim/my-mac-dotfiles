# ~/.zshrc

# Oh My Zsh for plugin support (themes are disabled in favor of Oh My Posh)
export ZSH="$HOME/.dotfiles/oh-my-zsh"
ZSH_THEME=""  # disable Oh My Zsh's default theme
plugins=(
  git
  docker
  kubectl
  node
  npm
  yarn
  python
  ruby
  golang
  rust
)
source $ZSH/oh-my-zsh.sh

# Load universal dotfiles
# for file in aliases exports functions completion extra_init; do
#   [[ -f "$HOME/.dotfiles/${file}.sh" ]] && source "$HOME/.dotfiles/${file}.sh"
# done

# Load shared dotfiles
[ -f ~/.dotfiles/aliases.sh ]     && source ~/.dotfiles/aliases.sh
[ -f ~/.dotfiles/exports.sh ]     && source ~/.dotfiles/exports.sh
[ -f ~/.dotfiles/functions.sh ]   && source ~/.dotfiles/functions.sh
[ -f ~/.dotfiles/completion.sh ]  && source ~/.dotfiles/completion.sh
[ -f ~/.dotfiles/extra_init.sh ]  && source ~/.dotfiles/extra_init.sh
