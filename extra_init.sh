# ~/.dotfiles/extra_init.sh

if [[ -n "$BASH_VERSION" ]]; then
  # Only load Starship for Bash prompt
  command -v starship &>/dev/null && eval "$(starship init bash)"

  # Oh My Posh — only if config is Bash-compatible
  THEME="$HOME/.poshthemes/kushal.omp.json"
  if command -v oh-my-posh &>/dev/null && [[ "$(file -b "$THEME")" == *"ASCII text"* ]]; then
    eval "$(oh-my-posh init bash --config "$THEME")"
  fi

elif [[ -n "$ZSH_VERSION" ]]; then
  # Starship and Oh My Posh in Zsh
  command -v starship &>/dev/null && eval "$(starship init zsh)"
  command -v oh-my-posh &>/dev/null && eval "$(oh-my-posh init zsh --config ~/.poshthemes/1_shell.omp.json)"

  # Zsh-only Bun completions
  [[ -s "$HOME/.bun/_bun" ]] && source "$HOME/.bun/_bun"
fi
