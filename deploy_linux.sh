#!/usr/bin/env bash
# andrzej lichnerowicz, unlicensed (~public domain)

# Install Visual Studio Code (w/ Insiders) settings
[[ -d $HOME/.config/Code ]] && cp -f vscode/*.json $HOME/.config/Code/User/
[[ -d "$HOME/.config/Code - Insiders" ]] && cp -f vscode/*.json "$HOME/.config/Code - Insiders/User/"

gsettings set org.pantheon.terminal.settings font 'Roboto Mono 11'

# Ubuntu needs this file to be .bashrc, not profile like macOS
ln -s $(pwd)/dot/bash_profile ~/.bashrc
