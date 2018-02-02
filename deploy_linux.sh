#!/usr/bin/env zsh
# &copy;2016-2017;-0xaL;unlicensed (~public domain)

# Install Visual Studio Code (w/ Insiders) settings
[[ -d $HOME/.config/Code ]] && cp -f vscode/*.json $HOME/.config/Code/User/
[[ -d "$HOME/.config/Code - Insiders" ]] && cp -f vscode/*.json "$HOME/.config/Code - Insiders/User/"