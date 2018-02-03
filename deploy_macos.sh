#!/usr/bin/env zsh
# andrzej lichnerowicz, unlicensed (~public domain)

# Install Visual Studio Code (w/ Insiders) settings
[[ -d $HOME/Library/Application\ Support/Code/User ]] && cp -f vscode/*.json $HOME/Library/Application\ Support/Code/User
[[ -d $HOME/Library/Application\ Support/Code\ -\ Insiders/User ]] && cp -f vscode/*.json $HOME/Library/Application\ Support/Code\ -\ Insiders/User

