# ~/.dotfiles/completion.sh

# Universal (for both Bash and Zsh)
[[ -d "/opt/homebrew/share" ]] && FPATH="/opt/homebrew/share:$FPATH"

# Create zsh cache dir
mkdir -p "${XDG_CACHE_HOME:-$HOME/.cache}/zsh"

# --------------------------
# --- Bash Completion ------
# --------------------------
if [[ -n "$BASH_VERSION" ]]; then
  [[ -f /opt/homebrew/etc/profile.d/bash_completion.sh ]] && source /opt/homebrew/etc/profile.d/bash_completion.sh
  [[ -f /opt/homebrew/etc/bash_completion ]] && source /opt/homebrew/etc/bash_completion

  # Load bash-preexec first
  [[ -f /opt/homebrew/opt/bash-preexec/share/bash-preexec/bash-preexec.sh ]] && source /opt/homebrew/opt/bash-preexec/share/bash-preexec/bash-preexec.sh

  # Then load bash-autosuggestions
  [[ -f "$HOME/.dotfiles/bash-autosuggestions/bash-autosuggestions.sh" ]] && source "$HOME/.dotfiles/bash-autosuggestions/bash-autosuggestions.sh"
fi


# -------------------------
# --- Zsh Completion ------
# -------------------------
if [[ -n "$ZSH_VERSION" ]]; then
  # Homebrew zsh completions
  if type brew &>/dev/null; then
    FPATH="$(brew --prefix)/share/zsh-completions:$FPATH"
  fi

  # Fix insecure directory warnings
  chmod go-w /opt/homebrew/share &>/dev/null
  chmod -R go-w /opt/homebrew/share/zsh &>/dev/null

  autoload -Uz compinit bashcompinit
  compinit
  bashcompinit

  # Autosuggestions & Syntax Highlighting
  [[ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  [[ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# ----------------------------
# --- Dev Tool Completions ---
# ----------------------------
for tool in git docker kubectl npm yarn pnpm node nvm python3 pip go cargo rustc ruby rails bun deno; do
  command -v "$tool" &>/dev/null && echo "✔ completion ready: $tool"
done
