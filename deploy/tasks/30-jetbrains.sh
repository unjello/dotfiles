#!/usr/bin/env bash
toolbox_url=https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.14.5037.tar.gz
toolbox_tmp=jebrains_toolbox.tar.gz

if [[ ! -f /opt/jetbrains/jetbrains-toolbox ]]; then
  mkdir -p ~/temp_deploy
  echo "Downloading JetBrains Toolbox..."
  pushd ~/temp_deploy >/dev/null && curl -#SL $toolbox_url -o $toolbox_tmp 
  if [[ $? -ge 1 ]]; then
    echo "There was a problem with downloading JetBrains Toolbox. Skipping ..."
  else
    sudo mkdir -p /opt/jetbrains
    sudo chown $(whoami): -R /opt/jetbrains
    tar -zxf $toolbox_tmp -C /opt/jetbrains --strip-components=1
  fi

  popd >/dev/null && rm -rf ~/temp_deploy
else
  echo "JetBrains Toolbox is already installed"
fi
