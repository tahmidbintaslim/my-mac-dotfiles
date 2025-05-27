# ~/.dotfiles/extra_init.sh

# Determine current shell
CURRENT_SHELL=$(basename "$SHELL")

# Load Starship (cross-shell prompt enhancer)
if command -v starship &>/dev/null; then
  eval "$(starship init $CURRENT_SHELL)"
fi

# Load Oh My Posh (cross-shell theme engine)
if command -v oh-my-posh &>/dev/null; then
  case "$CURRENT_SHELL" in
    bash) eval "$(oh-my-posh init bash --config ~/.poshthemes/kushal.omp.json)" ;;
    zsh)  eval "$(oh-my-posh init zsh --config ~/.poshthemes/1_shell.omp.json)" ;;
  esac
fi

# --- Bash-specific ---
if [[ -n "$BASH_VERSION" ]]; then
  [[ -f "$HOME/.bash_it/bash_it.sh" ]] && source "$HOME/.bash_it/bash_it.sh"
fi

# --- Zsh-specific ---
if [[ -n "$ZSH_VERSION" ]]; then
  # Bun completion
  [[ -s "$HOME/.bun/_bun" ]] && source "$HOME/.bun/_bun"

  # Autosuggestions & Syntax Highlighting
  [[ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  [[ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

  # Insecure directory fix
  chmod go-w /opt/homebrew/share &>/dev/null
  chmod -R go-w /opt/homebrew/share/zsh &>/dev/null

  # Safe compinit
  autoload -Uz compinit && compinit
fi

# --- Language Version Managers (universal) ---
# NVM
export NVM_DIR="$HOME/.nvm"
[[ -s "/opt/homebrew/opt/nvm/nvm.sh" ]] && source "/opt/homebrew/opt/nvm/nvm.sh"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d "$PYENV_ROOT" ]] && export PATH="$PYENV_ROOT/bin:$PATH"
command -v pyenv &>/dev/null && eval "$(pyenv init --path)" && eval "$(pyenv init -)"

# Rbenv
export RBENV_ROOT="$HOME/.rbenv"
[[ -d "$RBENV_ROOT" ]] && export PATH="$RBENV_ROOT/bin:$PATH"
if [[ -n "$ZSH_VERSION" ]]; then
  command -v rbenv &>/dev/null && eval "$(rbenv init - zsh)"
elif [[ -n "$BASH_VERSION" ]]; then
  command -v rbenv &>/dev/null && eval "$(rbenv init - bash)"
fi

# Rust
[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"
