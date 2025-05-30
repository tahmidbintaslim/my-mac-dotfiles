# ~/.dotfiles/extra_init.sh

# Determine current shell (used for fallback prompt engine)
CURRENT_SHELL=$(basename "$SHELL")

# -------------------------------
# Prompt + Theme Initialization
# -------------------------------

if command -v oh-my-posh &>/dev/null; then
  if [[ -n "$ZSH_VERSION" ]]; then
    eval "$(oh-my-posh init zsh --config ~/.poshthemes/1_shell.omp.json)"
  elif [[ -n "$BASH_VERSION" ]]; then
    eval "$(oh-my-posh init bash --config ~/.poshthemes/kushal.omp.json)"
  fi
elif command -v starship &>/dev/null; then
  eval "$(starship init "$CURRENT_SHELL")"
fi

# -------------------------------
# Shell-Specific Setup
# -------------------------------

if [[ -n "$BASH_VERSION" ]]; then
  [[ -f "$HOME/.bash_it/bash_it.sh" ]] && source "$HOME/.bash_it/bash_it.sh"
fi

if [[ -n "$ZSH_VERSION" ]]; then
  [[ -s "$HOME/.bun/_bun" ]] && source "$HOME/.bun/_bun"
  [[ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  [[ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

  chmod go-w /opt/homebrew/share &>/dev/null
  chmod -R go-w /opt/homebrew/share/zsh &>/dev/null

  autoload -Uz compinit && compinit
fi

# -------------------------------
# Language Version Managers
# -------------------------------

# Node: NVM
export NVM_DIR="$HOME/.nvm"
[[ -s "/opt/homebrew/opt/nvm/nvm.sh" ]] && source "/opt/homebrew/opt/nvm/nvm.sh"
if [[ -n "$BASH_VERSION" && -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ]]; then
  source "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
fi

# Python: pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d "$PYENV_ROOT" ]] && export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv &>/dev/null; then
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi

# Ruby: rbenv
export RBENV_ROOT="$HOME/.rbenv"
[[ -d "$RBENV_ROOT" ]] && export PATH="$RBENV_ROOT/bin:$PATH"
if command -v rbenv &>/dev/null; then
  if [[ -n "$ZSH_VERSION" ]]; then
    eval "$(rbenv init - zsh)"
  elif [[ -n "$BASH_VERSION" ]]; then
    eval "$(rbenv init - bash)"
  fi
fi

# Go
export PATH="$HOME/go/bin:$PATH"

# Rust
if [[ -f "$HOME/.cargo/env" ]]; then
  source "$HOME/.cargo/env"
elif [[ -f "$(brew --prefix rustup)/etc/bash_completion.d/rustup" ]]; then
  source "$(brew --prefix rustup)/etc/bash_completion.d/rustup"
  export PATH="$(brew --prefix rustup)/bin:$PATH"
fi

# Load autoupdate logic
[[ -f ~/.dotfiles/autoupdate_init.sh ]] && source ~/.dotfiles/autoupdate_init.sh