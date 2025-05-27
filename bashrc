# ~/.bashrc

# Only run in interactive sessions
case $- in
  *i*) ;;
  *) return;;
esac

# Load universal dotfiles
# for file in aliases exports functions completion extra_init; do
#   [[ -f "$HOME/.dotfiles/${file}.sh" ]] && source "$HOME/.dotfiles/${file}.sh"
# done


# Load shared dotfiles
[ -f ~/.dotfiles/aliases.sh ]     && source ~/.dotfiles/aliases.sh
[ -f ~/.dotfiles/exports.sh ]     && source ~/.dotfiles/exports.sh
[ -f ~/.dotfiles/functions.sh ]   && source ~/.dotfiles/functions.sh
[ -f ~/.dotfiles/completion.sh ]  && source ~/.dotfiles/completion.sh
[ -f ~/.dotfiles/extra_init.sh ]  && source ~/.dotfiles/extra_init.sh
