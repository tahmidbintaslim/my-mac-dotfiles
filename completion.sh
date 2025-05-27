# ~/.dotfiles/completion.sh

if [[ -n "$BASH_VERSION" ]]; then
  # Bash: Homebrew completions
  [ -f /opt/homebrew/etc/bash_completion ] \
    && source /opt/homebrew/etc/bash_completion
fi

# (Zsh completions handled in ~/.zshrc)
