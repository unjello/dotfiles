#!/usr/bin/env bash

if [[ $(getOsFamily) = "rhel" ]]; then
    sudo yum group mark install "Development Tools"
    sudo yum group update "Development Tools"
fi