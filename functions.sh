# ~/.dotfiles/functions.sh

mkcd() {
  mkdir -p "$1" && cd "$1"
}

# # Bookmark current dir with name
# bookmark() {
#   local markdir="$HOME/.bookmarks"
#   mkdir -p "$markdir"
#   local name="$1"
#   if [[ -z "$name" ]]; then
#     echo "Usage: bookmark <name>"
#     return 1
#   fi
#   echo "cd \"$(pwd)\"" > "$markdir/$name"
#   chmod +x "$markdir/$name"
# }

# # Jump to bookmarked dir
# go() {
#   local markdir="$HOME/.bookmarks"
#   local name="$1"
#   if [[ -f "$markdir/$name" ]]; then
#     source "$markdir/$name"
#   else
#     echo "Bookmark '$name' not found"
#   fi
# }

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
