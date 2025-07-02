# 💎 **Updated README**

````markdown
# 🌟 Dotfiles for macOS Terminal (Bash + Zsh)

Modern, modular, and cross-shell dotfiles setup designed for developers who work across **Bash**, **Zsh**, and tools like **iTerm2** or **Warp Terminal**. Provides a unified experience with intelligent autocompletion, prompt theming (Oh My Posh), and version managers — all stored neatly inside `~/.dotfiles`.

---

## 📦 Features at a Glance

| Shell                     | Framework    | Prompt Theme                   | Status |
| ------------------------- | ------------ | ------------------------------ | ------ |
| **Bash**                  | None         | Oh My Posh `kushal.omp.json`   | ✅     |
| **Zsh**                   | Oh My Zsh    | Oh My Posh `1_shell.omp.json`  | ✅     |
| **iTerm / Warp**          | Inherits     | Shared Config                  | ✅     |

---

## 🗂 Folder Structure

```plaintext
~/.dotfiles/
├── aliases.sh             # Common shell aliases
├── autoupdate_init.sh     # Homebrew auto-update logic
├── bashrc                 # Symlinked to ~/.bashrc
├── completion.sh          # Autocompletion for Bash & Zsh
├── exports.sh             # Environment variables (PATH, LANG, EDITOR)
├── extra_init.sh          # Prompt, theme, version managers
├── functions.sh           # Handy functions: mkcd, extract, etc.
├── install_fonts.sh       # Script to install Nerd Fonts
├── oh-my-posh-themes/     # All Oh My Posh themes
│   └── themes/
│       ├── 1_shell.omp.json
│       ├── kushal.omp.json
│       └── ...
├── oh-my-zsh/             # Local Oh My Zsh framework
├── set_terminal_font.scpt # AppleScript to apply font to Terminal
├── fonts/                 # Nerd Font files (Meslo recommended)
└── zshrc                  # Symlinked to ~/.zshrc
````

---

## 🧩 Components

### ✅ `aliases.sh`

* Shortcuts for Git, Docker, navigation, etc.

### ✅ `completion.sh`

* Universal completions for both Bash & Zsh.
* Supports `git`, `docker`, `node`, `nvm`, `pyenv`, `rbenv`, `go`, `rust`, and more.

### ✅ `exports.sh`

* Sets `PATH`, `LANG`, `EDITOR=code -w`.

### ✅ `extra_init.sh`

* Detects current shell and loads:

  * Oh My Posh themes (Bash: `kushal.omp.json`, Zsh: `1_shell.omp.json`).
  * Oh My Zsh plugins from `.dotfiles/oh-my-zsh`.
  * Initializes `nvm`, `pyenv`, `rbenv`, `rustup`, `go`, and `bun`.

### ✅ `functions.sh`

* `mkcd <dir>`: Make and cd into a directory.
* `extract <file>`: Automatically decompress `.zip`, `.tar.gz`, `.7z`, etc.

### ✅ Nerd Fonts

* Installs MesloLGS Nerd Font into `~/Library/Fonts`.
* AppleScript sets the Terminal font automatically.

---

## 🛠 Setup Guide

### 1️⃣ Clone the Dotfiles

```bash
git clone https://github.com/your-username/dotfiles.git ~/.dotfiles
```

---

### 2️⃣ Link Shell Configs

```bash
ln -sf ~/.dotfiles/bashrc ~/.bashrc
ln -sf ~/.dotfiles/zshrc ~/.zshrc
```

---

### 3️⃣ Install Fonts

```bash
bash ~/.dotfiles/install_fonts.sh
osascript ~/.dotfiles/set_terminal_font.scpt
```

---

### 4️⃣ Install Required Tools

```bash
brew install oh-my-posh starship
brew install bash-completion zsh-completions zsh-autosuggestions zsh-syntax-highlighting
brew install nvm pyenv rbenv go rustup-init
```

> ✅ After installing Rust: `rustup default stable`.

> ✅ Create nvm folder if missing: `mkdir ~/.nvm`.

---

### 5️⃣ Install Oh My Zsh

```bash
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.dotfiles/oh-my-zsh
```

---

## 🎨 Prompt Preview

```bash
oh-my-posh print primary --config ~/.dotfiles/oh-my-posh-themes/themes/kushal.omp.json  # Bash
oh-my-posh print primary --config ~/.dotfiles/oh-my-posh-themes/themes/1_shell.omp.json # Zsh
```

---

## 🧪 Verify Setup

From both Bash and Zsh:

```bash
which oh-my-posh
nvm -v
node -v
pyenv --version
rbenv --version
rustc --version
```

---

## 👨‍💻 Author

**Tahmid Bin Taslim Rafi**
MIT Licensed

> Suggestions and PRs are welcome to extend support for Linux/WSL, Kitty, or Windows Terminal.

---