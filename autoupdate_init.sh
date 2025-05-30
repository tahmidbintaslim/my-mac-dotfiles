# ~/.dotfiles/autoupdate_init.sh

# Setup Homebrew autoupdate using LaunchAgents (not cron)
if command -v brew &>/dev/null; then
  if ! brew autoupdate status | grep -q "Autoupdate has been started"; then
    echo "🔁 Starting brew autoupdate background service..."
    brew tap domt4/autoupdate &>/dev/null
    brew autoupdate start --upgrade --cleanup --immediate
  else
    echo "✅ brew autoupdate already running"
  fi
fi