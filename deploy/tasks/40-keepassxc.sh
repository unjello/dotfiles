#!/usr/bin/env bash

declare -f getOsFamily || . 00-detect-os.sh

if [[ "$(getOsFamily)" = "ubuntu" ]]; then
  sudo add-apt-repository ppa:phoerious/keepassxc -y
  sudo apt update
  sudo apt install keepassxc -y
fi