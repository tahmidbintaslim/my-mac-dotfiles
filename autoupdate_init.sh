# ~/.dotfiles/autoupdate_init.sh

# Setup Homebrew autoupdate using LaunchAgents (not cron)
if command -v brew &>/dev/null; then
  if ! pgrep -f 'homebrew.autoupdate' > /dev/null; then
    echo "🔁 Starting brew autoupdate background service..."
    brew tap domt4/autoupdate
    brew autoupdate start --upgrade --cleanup --enable-notifications
  fi
fi
