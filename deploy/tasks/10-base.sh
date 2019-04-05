#!/usr/bin/env bash

# Inline with Upstream Stable
if [[ $(getOsFamily) = "rhel"]]; then
    sudo yum install -y https://centos7.iuscommunity.org/ius-release.rpm
fi
