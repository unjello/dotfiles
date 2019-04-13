#!/usr/bin/env bash

os=$(getOsFamily)
if [[ "$os" = "rhel"]]; then
    # Inline with Upstream Stable
    sudo yum install -y https://centos7.iuscommunity.org/ius-release.rpm
elif [[ "$os" = "ubuntu" ]]; then
    sudo apt install software-properties-common build-essential -y
fi

# Install git prompt helpers
mkdir -p ~/bin
curl -#SL https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/bin/.git-completion.bash
curl -#SL https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/bin/.git-prompt.bash
