#!/usr/bin/env zsh
# andrzej lichnerowicz, unlicensed (~public domain)

# Install Visual Studio Code (w/ Insiders) settings
[[ -d $HOME/Library/Application\ Support/Code/User ]] && ln -s $(pwd)/vscode/keybindings.json $HOME/Library/Application\ Support/Code/User/keybindings.json
[[ -d $HOME/Library/Application\ Support/Code/User ]] && ln -s $(pwd)/vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
[[ -d $HOME/Library/Application\ Support/Code\ -\ Insiders/User ]] && ln -s $(pwd)/vscode/keybindings.json $HOME/Library/Application\ Support/Code\ -\ Insiders/User/keybindings.json"
[[ -d $HOME/Library/Application\ Support/Code\ -\ Insiders/User ]] && ln -s $(pwd)/vscode/settings.json $HOME/Library/Application\ Support/Code\ -\ Insiders/User/settings.json"

# install bash_profile
ln -s $(pwd)/dot/bash_profile ~/.bash_profile

# Link git settings
ln -s $(pwd)/dot/gitignore_global ~/.gitignore_global
ln -s $(pwd)/dot/gitconfig ~/.gitconfig
