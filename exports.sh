# ~/.dotfiles/exports.sh

# Add Homebrew to PATH (for oh-my-posh, starship, etc.)
if [ -d "/opt/homebrew/bin" ]; then
  export PATH="/opt/homebrew/bin:$PATH"
fi

# Your local bin folder
export PATH="$HOME/bin:$PATH"

# Locale and default editor
export LANG=en_US.UTF-8
export EDITOR="code -w"
