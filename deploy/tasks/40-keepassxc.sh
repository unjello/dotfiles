#!/usr/bin/env bash
[[ -z "$CORE_INCLUDED" ]] && { echo "Do not run directly. Use deploy.sh or run.sh"; exit 1; }

if [[ "$(getOsFamily)" = "ubuntu" ]]; then
  sudo add-apt-repository ppa:phoerious/keepassxc -y
  sudo apt update
  sudo apt install keepassxc -y
fi