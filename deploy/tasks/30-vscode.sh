#!/usr/bin/env bash
[[ -z "$CORE_INCLUDED" ]] && { echo "Do not run directly. Use deploy.sh or run.sh"; exit 1; }

# Install Visual Studio Code per
# https://code.visualstudio.com/docs/setup/linux

if [[ "$(getOsFamily)" = "rhel"]]; then
  sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
  sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
  sudo yum check-update
  sudo yum -y install code
fi

code --install-extension sdras.night-owl
code --install-extension vscoss.vscode-ansible
code --install-extension robertohuertasm.vscode-icons
code --install-extension rust-lang.rust
code --install-extension samuelcolvin.jinjahtml
code --install-extension vector-of-bool.cmake-tools
code --install-extension twxs.cmake
code --install-extension alesiong.clang-tidy-linter
code --install-extension ms-vscode.go
code --install-extension editorconfig.editorconfig
code --install-extension letrieu.expand-region
code --install-extension vscjava.vscode-java-pack
code --install-extension esbenp.prettier-vscode
code --install-extension dbaeumer.vscode-eslint
code --install-extension nodesource.vscode-for-node-js-development-pack
code --install-extension 2gua.rainbow-brackets
code --install-extension k--kato.intellij-idea-keybindings
