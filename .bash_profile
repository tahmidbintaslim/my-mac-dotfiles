# ~/.bash_profile

# Only run in interactive sessions
case $- in
    *i*) ;;
    *) return ;;
esac

if [ -f "$HOME/.bashrc" ]; then
  source "$HOME/.bashrc"
fi
