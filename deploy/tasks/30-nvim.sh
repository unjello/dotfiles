#!/usr/bin/env bash

os=$(getOsFamily)
if [[ "$os" == "redhat" ]]; then
    sudo yum --enablerepo=epel -y install neovim
elif [[ "$os" == "ubuntu" ]]; then
    sudo apt-add-repository ppa:neovim-ppa/stable -y
    sudo apt update
    sudo apt install neovim -y
    pip3 install --user neovim

    sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
    sudo update-alternatives --config vi
    sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
    sudo update-alternatives --config vim
    sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
    sudo update-alternatives --config editor
fi