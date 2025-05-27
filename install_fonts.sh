#!/bin/bash

FONT_SRC="$HOME/.dotfiles/fonts"
FONT_DST="$HOME/Library/Fonts"

echo "📦 Installing fonts from $FONT_SRC to $FONT_DST..."

mkdir -p "$FONT_DST"

for font in "$FONT_SRC"/*.ttf; do
  echo "→ Installing $(basename "$font")"
  cp -f "$font" "$FONT_DST"
done

echo "✅ Done! You may need to restart your terminal and set the font manually if not already applied."
