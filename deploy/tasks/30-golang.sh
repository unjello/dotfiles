#!/usr/bin/env bash
golang_url="https://dl.google.com/go/go1.12.3.linux-amd64.tar.gz"
golang_tmp="go.tar.gz"

if [[ ! -d /opt/go ]]; then
  mkdir -p ~/temp_deploy
  echo "Downloading Go..."
  pushd ~/temp_deploy >/dev/null && curl -#SL $golang_url -o $golang_tmp
  if [[ $? -ge 1 ]]; then
    echo "There was a problem with downloading Go. Skipping ..."
  else
    sudo tar -zxf $golang_tmp -C /opt
    sudo chown `whoami`: -R /opt/go

    echo "Go successfully installed."
  fi
  popd >/dev/null && rm -rf ~/temp_deploy
else
    echo "Go is already installed"
fi