# ~/.dotfiles/autoupdate_init.sh

# debugging function
log() { echo "[brew-autoupdate] $1"; }

# Setup Homebrew autoupdate using LaunchAgents (not cron)
if command -v brew &>/dev/null; then
  if brew autoupdate status 2>/dev/null | grep -q "Autoupdate is installed and running"; then
    log "✅ Homebrew autoupdate is already running."
  else
    log "🔁 Starting Homebrew autoupdate service..."
    brew tap domt4/autoupdate &>/dev/null
    brew autoupdate start --upgrade --cleanup --immediate --greedy
  fi
fi