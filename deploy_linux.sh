#!/usr/bin/env bash
# andrzej lichnerowicz, unlicensed (~public domain)

# Install Visual Studio Code (w/ Insiders) settings
[[ -d $HOME/.config/Code ]] && ln -s $(pwd)/vscode/keybindings.json $HOME/.config/Code/User/keybindings.json
[[ -d $HOME/.config/Code ]] && ln -s $(pwd)/vscode/settings.json $HOME/.config/Code/User/settings.json
[[ -d "$HOME/.config/Code - Insiders" ]] && ln -s $(pwd)/vscode/keybindings.json "$HOME/.config/Code - Insiders/User/keybindings.json"
[[ -d "$HOME/.config/Code - Insiders" ]] && ln -s $(pwd)/vscode/settings.json "$HOME/.config/Code - Insiders/User/settings.json"

gsettings set org.pantheon.terminal.settings font 'Roboto Mono 11'

# Ubuntu needs this file to be .bashrc, not profile like macOS
ln -s $(pwd)/dot/bash_profile ~/.bashrc

# Link git settings
ln -s $(pwd)/dot/gitignore_global ~/.gitignore_global
ln -s $(pwd)/dot/gitconfig ~/.gitconfig

# Link emacs
ln -s $(pwd)/dot/emacs.d ~/.emacs.d
