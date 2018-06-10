#!/usr/bin/env zsh
# andrzej lichnerowicz, unlicensed (~public domain)

# Install Visual Studio Code (w/ Insiders) settings
[[ -d $HOME/Library/Application\ Support/Code/User ]] && cp -f vscode/*.json $HOME/Library/Application\ Support/Code/User
[[ -d $HOME/Library/Application\ Support/Code\ -\ Insiders/User ]] && cp -f vscode/*.json $HOME/Library/Application\ Support/Code\ -\ Insiders/User

# Install Fira Code
brew tap caskroom/fonts
brew cask install font-fira-code font-fira-mono font-fira-mono-for-powerline

# Install pip
easy_install pip

# Install [powerline-shell](https://github.com/powerline/powerline)
pip install --user powerline-status