#!/usr/bin/env zsh
# andrzej lichnerowicz, unlicensed (~public domain)

# Install Visual Studio Code (w/ Insiders) settings
[[ -d $HOME/.config/Code ]] && cp -f vscode/*.json $HOME/.config/Code/User/
[[ -d "$HOME/.config/Code - Insiders" ]] && cp -f vscode/*.json "$HOME/.config/Code - Insiders/User/"

gsettings set org.pantheon.terminal.settings font 'Fira Code 11

mkdir -p ~/.local/share/fonts
for type in Bold Light Medium Regular Retina; do
    wget -O ~/.local/share/fonts/FiraCode-${type}.ttf \
    "https://github.com/tonsky/FiraCode/blob/master/distr/ttf/FiraCode-${type}.ttf?raw=true";
done
fc-cache -f
