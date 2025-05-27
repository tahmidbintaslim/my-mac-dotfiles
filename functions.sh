# ~/.dotfiles/functions.sh

mkcd() {
  mkdir -p "$1" && cd "$1"
}

# Simple bashmarks clone
bookmark() {
  echo "cd \"$PWD\"" > "$HOME/.bookmarks/$1"
  chmod +x "$HOME/.bookmarks/$1"
}

go() {
  if [ -f "$HOME/.bookmarks/$1" ]; then
    source "$HOME/.bookmarks/$1"
  else
    echo "Bookmark '$1' not found"
  fi
}

extract() {
  if [[ -f "$1" ]]; then
    case "$1" in
      *.tar.bz2) tar xjf "$1" ;;
      *.tar.gz)  tar xzf "$1" ;;
      *.bz2)     bunzip2 "$1" ;;
      *.rar)     unrar x "$1" ;;
      *.gz)      gunzip "$1" ;;
      *.tar)     tar xf "$1" ;;
      *.tbz2)    tar xjf "$1" ;;
      *.tgz)     tar xzf "$1" ;;
      *.zip)     unzip "$1" ;;
      *.Z)       uncompress "$1" ;;
      *.7z)      7z x "$1" ;;
      *)         echo "Cannot extract '$1'" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
