# Dotfiles for Mac Terminal Setup

## Overview

This repository contains a modular and modern setup for managing your Bash and Zsh environments on macOS. It includes support for plugin managers, prompt theming, font installation, and reusable functions.

## Shell Configuration Summary

| Shell                     | Plugins           | Theme Engine                    | Prompt Enhancer | Status |
| ------------------------- | ----------------- | ------------------------------- | --------------- | ------ |
| **Bash**                  | Bash-it           | Oh My Posh (`kushal.omp.json`)  | Starship        | ✅     |
| **Zsh**                   | Oh My Zsh         | Oh My Posh (`1_shell.omp.json`) | Starship        | ✅     |
| **iTerm / Wrap Terminal** | Inherits Bash/Zsh | Shared Config                   | Shared Config   | ✅     |

## Folder Structure

```sh
~/.dotfiles/
├── aliases.sh             # Common shell aliases
├── completion.sh          # Bash-specific autocompletions
├── exports.sh             # Environment variables and $PATH
├── extra_init.sh          # Loads starship + oh-my-posh dynamically
├── functions.sh           # Utility functions: mkcd, extract, etc.
├── fonts/                 # Custom nerd fonts
├── install_fonts.sh       # Font installer script
└── set_terminal_font.scpt # AppleScript to set Terminal font
```

## Features

### ✅ Aliases (`aliases.sh`)

- Git shortcuts (`gs`, `gl`, `gp`, etc.)
- Directory movement (`..`, `...`, etc.)

### ✅ Completions (`completion.sh`)

- Loads Homebrew's `bash_completion` if Bash is detected.

### ✅ Exports (`exports.sh`)

- Appends `/opt/homebrew/bin` and `$HOME/bin` to `$PATH`
- Sets `LANG` and `EDITOR` (VS Code with `code -w`)

### ✅ Extra Init (`extra_init.sh`)

- Dynamically loads `starship` and `oh-my-posh` per shell type
- Bash uses `kushal.omp.json`, Zsh uses `1_shell.omp.json`

### ✅ Functions (`functions.sh`)

- `mkcd`: Create and `cd` into a directory
- `extract`: Decompress archives (`.zip`, `.tar.gz`, etc.)

### ✅ Fonts (`fonts/` + `install_fonts.sh`)

- Install custom Nerd Fonts to `~/Library/Fonts`
- Includes MesloLGS Nerd Font for proper glyph support

### ✅ AppleScript Font Setter (`set_terminal_font.scpt`)

- Automatically sets macOS Terminal font to MesloLGS Nerd Font
- Targets the current profile (e.g. "Basic")

## Installation

### 1. Clone the Repo

```sh
git clone https://github.com/your-username/your-dotfiles-repo.git ~/.dotfiles
```

### 2. Install Fonts

```sh
bash ~/.dotfiles/install_fonts.sh
osascript ~/.dotfiles/set_terminal_font.scpt
```

### 3. Source Your Shell

Ensure your `.bashrc` or `.zshrc` includes:

```sh
# ~/.bashrc or ~/.zshrc
[ -f ~/.dotfiles/exports.sh ]     && source ~/.dotfiles/exports.sh
[ -f ~/.dotfiles/aliases.sh ]     && source ~/.dotfiles/aliases.sh
[ -f ~/.dotfiles/functions.sh ]   && source ~/.dotfiles/functions.sh
[ -f ~/.dotfiles/completion.sh ]  && source ~/.dotfiles/completion.sh
[ -f ~/.dotfiles/extra_init.sh ]  && source ~/.dotfiles/extra_init.sh
```

### 4. Optional: Bash-it (Bash Plugin Manager)

Install and enable desired plugins:

```sh
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
~/.bash_it/install.sh --silent
bash-it enable plugin git
bash-it enable completion git
bash-it enable alias general
```

### 5. Tools to Install

```sh
brew install starship oh-my-posh
```

## Prompt Previews

```sh
oh-my-posh print primary --config ~/.poshthemes/kushal.omp.json  # Bash
oh-my-posh print primary --config ~/.poshthemes/1_shell.omp.json # Zsh
```

---

## License

MIT

---

## Author

Tahmid Bint Aslim Rafi
