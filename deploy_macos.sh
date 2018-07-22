#!/usr/bin/env zsh
# andrzej lichnerowicz, unlicensed (~public domain)

# Install Visual Studio Code (w/ Insiders) settings
[[ -d $HOME/.config/Code ]] && ln -s $(pwd)/vscode/keybindings.json $HOME/.config/Code/User/keybindings.json
[[ -d $HOME/.config/Code ]] && ln -s $(pwd)/vscode/settings.json $HOME/.config/Code/User/settings.json
[[ -d "$HOME/.config/Code - Insiders" ]] && ln -s $(pwd)/vscode/keybindings.json "$HOME/.config/Code - Insiders/User/keybindings.json"
[[ -d "$HOME/.config/Code - Insiders" ]] && ln -s $(pwd)/vscode/settings.json "$HOME/.config/Code - Insiders/User/settings.json"

# install bash_profile
ln -s $(pwd)/dot/bash_profile ~/.bash_profile
