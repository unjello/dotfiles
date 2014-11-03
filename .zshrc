#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

alias e='emacsclient -t'
alias ec='emacsclient -c'
alias vi='emacsclient -t'

alias napi='napi.sh -f microdvd -C UTF-8'

export XZ_OPT=-9ev
