#!/usr/bin/env bash

mkdir -p ~/.nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
source ~/.nvm/nvm.sh
nvm install 11
nvm use 11
npm i -g npm
npm i -g pnpm
npm i -g pm2
