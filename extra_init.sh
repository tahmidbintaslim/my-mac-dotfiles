# ~/.dotfiles/extra_init.sh

if [[ -n "$BASH_VERSION" ]]; then
  # Load bash-it
  [[ -f "$HOME/.bash_it/bash_it.sh" ]] && source "$HOME/.bash_it/bash_it.sh"

  # Starship & Oh My Posh
  command -v starship &>/dev/null && eval "$(starship init bash)"
  [[ -f "$HOME/.poshthemes/kushal.omp.json" ]] && eval "$(oh-my-posh init bash --config ~/.poshthemes/kushal.omp.json)"

  # NVM
  export NVM_DIR="$HOME/.nvm"
  [[ -s "/opt/homebrew/opt/nvm/nvm.sh" ]] && source "/opt/homebrew/opt/nvm/nvm.sh"

  # Pyenv
  command -v pyenv &>/dev/null && eval "$(pyenv init --path)" && eval "$(pyenv init -)"

  # rbenv
  command -v rbenv &>/dev/null && eval "$(rbenv init - bash)"

  # Rust
  [[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

elif [[ -n "$ZSH_VERSION" ]]; then
  # Starship & Oh My Posh
  command -v starship &>/dev/null && eval "$(starship init zsh)"
  [[ -f "$HOME/.poshthemes/1_shell.omp.json" ]] && eval "$(oh-my-posh init zsh --config ~/.poshthemes/1_shell.omp.json)"

  # Zsh Bun completion
  [[ -s "$HOME/.bun/_bun" ]] && source "$HOME/.bun/_bun"

  # Autosuggestions & Syntax Highlighting
  [[ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  [[ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

  # Fix insecure directory issues
  chmod go-w /opt/homebrew/share &>/dev/null
  chmod -R go-w /opt/homebrew/share/zsh &>/dev/null

  # Zsh completion init
  autoload -Uz compinit
  compinit

  # NVM
  export NVM_DIR="$HOME/.nvm"
  [[ -s "/opt/homebrew/opt/nvm/nvm.sh" ]] && source "/opt/homebrew/opt/nvm/nvm.sh"

  # Pyenv
  command -v pyenv &>/dev/null && eval "$(pyenv init --path)" && eval "$(pyenv init -)"

  # rbenv
  command -v rbenv &>/dev/null && eval "$(rbenv init - zsh)"

  # Rust
  [[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"
fi
