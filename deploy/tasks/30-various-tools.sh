#!/usr/bin/env bash

declare -f getOsFamily || . 00-detect-os.sh

os=$(getOsFamily)
if [[ "$os" = "rhel" ]]; then
    sudo yum -y install qalculate
elif [[ "$os" = "ubuntu" ]]; then
    sudo apt -y install qalc mesa_utils mc tmux 
fi

curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.10.0/ripgrep_0.10.0_amd64.deb
sudo dpkg -i ripgrep_0.10.0_amd64.deb
rm ripgrep_0.10.0_amd64.deb
