# 🌟 Dotfiles for macOS Terminal (Bash + Zsh)

Modern, modular, and cross-shell dotfiles setup designed for developers who work across **Bash**, **Zsh**, and tools like **iTerm** or **Wrap Terminal**. Provides a unified experience with intelligent autocompletion, prompt theming, and version managers—all stored neatly in `~/.dotfiles`.

---

## 📦 Features at a Glance

| Shell                     | Plugin Manager    | Prompt Theme                  | Prompt Enhancer | Status |
| ------------------------- | ----------------- | ----------------------------- | --------------- | ------ |
| **Bash**                  | \[Bash-it]        | Oh My Posh `kushal.omp.json`  | Starship        | ✅     |
| **Zsh**                   | \[Oh My Zsh]      | Oh My Posh `1_shell.omp.json` | Starship        | ✅     |
| **iTerm / Wrap Terminal** | Inherits Bash/Zsh | Shared Config                 | Shared Config   | ✅     |

---

## 🗂 Folder Structure

```sh
~/.dotfiles/
├── aliases.sh             # Common shell aliases
├── completion.sh          # Autocompletion for bash & zsh
├── exports.sh             # Environment variables (PATH, LANG, EDITOR)
├── extra_init.sh          # Prompt, theme, version managers
├── functions.sh           # Handy functions: mkcd, extract, etc.
├── install_fonts.sh       # Script to install Nerd Fonts
├── set_terminal_font.scpt # AppleScript to apply font to Terminal
├── fonts/                 # Nerd Font files (Meslo recommended)
├── bashrc                 # Symlinked to ~/.bashrc
└── zshrc                  # Symlinked to ~/.zshrc
```

---

## 🧩 Components

### ✅ `aliases.sh`

- Shortcuts for Git, Docker, navigation, and custom scripts.

### ✅ `completion.sh`

- Cross-shell completion using Homebrew tools.
- Auto-loads completions for `git`, `docker`, `node`, `nvm`, `pyenv`, `rbenv`, `go`, `rust`, and more.

### ✅ `exports.sh`

- Sets `PATH`, `LANG`, and `EDITOR=code -w` for VSCode.

### ✅ `extra_init.sh`

- Dynamically detects shell and loads:

  - Oh My Posh themes (`kushal.omp.json` for Bash, `1_shell.omp.json` for Zsh)
  - Fallbacks to Starship if Oh My Posh is not available.
  - Initializes `nvm`, `pyenv`, `rbenv`, `rustup`, `go`, and `bun`.

### ✅ `functions.sh`

- `mkcd <dir>`: Make and cd into directory.
- `extract <file>`: Automatically decompress `.zip`, `.tar.gz`, `.7z`, etc.

### ✅ Nerd Fonts

- Fonts (MesloLGS Nerd Font) installed via script into `~/Library/Fonts`.
- AppleScript sets the terminal font programmatically.

---

## 🛠 Setup Guide

### 1. Clone the Dotfiles

```bash
git clone https://github.com/your-username/dotfiles.git ~/.dotfiles
```

### 2. Link Shell Configs

```bash
ln -sf ~/.dotfiles/bashrc ~/.bashrc
ln -sf ~/.dotfiles/zshrc ~/.zshrc
```

### 3. Install Fonts

```bash
bash ~/.dotfiles/install_fonts.sh
osascript ~/.dotfiles/set_terminal_font.scpt
```

### 4. Install Required Tools

```bash
brew install starship oh-my-posh
brew install bash-completion zsh-completions zsh-autosuggestions zsh-syntax-highlighting
brew install nvm pyenv rbenv go rustup-init
```

> ✅ Run `rustup default stable` and `mkdir ~/.nvm` after install if needed.

### 5. Enable Bash-it (optional)

```bash
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
~/.bash_it/install.sh --silent
bash-it enable plugin git
bash-it enable completion git
bash-it enable alias general
```

---

## 🎨 Prompt Preview

```bash
oh-my-posh print primary --config ~/.poshthemes/kushal.omp.json  # Bash
oh-my-posh print primary --config ~/.poshthemes/1_shell.omp.json # Zsh
```

---

## 🧪 Verify Setup

From both Bash and Zsh:

```bash
which starship
which oh-my-posh
nvm -v
pyenv --version
rbenv --version
rustc --version
```

---

## 👨‍💻 Author

**Tahmid Bint Aslim Rafi**
MIT Licensed

> Suggestions and PRs are welcome to extend support for Linux/WSL, Kitty, or Windows Terminal profiles.

---
