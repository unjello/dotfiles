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
ec() { emacsclient -c $1 & }
backup() { tar -cJ $1 | gpg -o $1.tar.xz.gpg -er 'andrzej@lichnerowicz.pl' }
alias vi='emacsclient -t'
export EDITOR='emacsclient -t'
export VISUAL='emacsclient -c'
export ALTERNATE_EDITOR=''

alias napi='napi.sh -f microdvd -C UTF-8'
alias ytdl='youtube-dl -no "%(id)s-%(title)s.%(ext)s" --user-agent "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36" --sleep-interval 20 -vr 200K'

export XZ_OPT=-9ev

enc() { openssl aes-256-cbc -a -salt -in $1 -out $1.enc }
dec() { openssl aes-256-cbc -d -a -in $1 -out $2 }

export PATH=~/.rbenv/shims:$PATH
