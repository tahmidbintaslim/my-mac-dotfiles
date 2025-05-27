# ~/.dotfiles/completion.sh

# Ensure Homebrew completions come first
[[ -d "/opt/homebrew/share" ]] && FPATH="/opt/homebrew/share:$FPATH"

# Create zsh cache dir
mkdir -p "${XDG_CACHE_HOME:-$HOME/.cache}/zsh"

# --- Bash Completion ---
if [[ -n "$BASH_VERSION" ]]; then
  [[ -f /opt/homebrew/etc/profile.d/bash_completion.sh ]] && source /opt/homebrew/etc/profile.d/bash_completion.sh
  [[ -f /opt/homebrew/etc/bash_completion ]] && source /opt/homebrew/etc/bash_completion
fi

# --- Zsh Completion ---
if [[ -n "$ZSH_VERSION" ]]; then
  autoload -Uz compinit bashcompinit
  compinit
  bashcompinit

  # Add zsh-completions from brew
  if type brew &>/dev/null; then
    FPATH="$(brew --prefix)/share/zsh-completions:$FPATH"
  fi

  # Autosuggestions & Syntax Highlighting
  [[ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  [[ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# --- Dev Tool Completions ---
# (Brew-installed tools usually auto-register completions)
for tool in git docker kubectl npm yarn pnpm node nvm python3 pip go cargo rustc ruby rails bun deno; do
  command -v "$tool" &>/dev/null && echo "✔ completion ready: $tool"
done
