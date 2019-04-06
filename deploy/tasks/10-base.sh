#!/usr/bin/env bash

# Inline with Upstream Stable
if [[ $(getOsFamily) = "rhel"]]; then
    sudo yum install -y https://centos7.iuscommunity.org/ius-release.rpm
fi

# Install git prompt helpers
mkdir -p ~/bin
curl -#SL https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/bin/.git-completion.bash
curl -#SL https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/bin/.git-prompt.bash
