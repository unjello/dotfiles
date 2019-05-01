#!/usr/bin/env bash
[[ -z "$CORE_INCLUDED" ]] && { echo "Do not run directly. Use deploy.sh or run.sh"; exit 1; }

if [[ ! -f /usr/local/bin/bonzomatic ]]; then
  echo "Downloading Bonzomatic build dependencies..."
  sudo apt install -y libxinerama-dev libxcursor-dev libxi-dev libgl1-mesa-dev freeglut3-dev
  
  mkdir -p ~/temp_deploy
  echo "Downloading Bonzomatic..."
  pushd ~/temp_deploy >/dev/null && git clone https://github.com/Gargaj/Bonzomatic.git
  if [[ $? -ge 1 ]]; then
    echo "There was a problem with downloading Bonzomatic git repo. Skipping ..."
  else
    mkdir -p Bonzomatic/build
    pushd Bonzomatic/build && cmake .. && make && sudo make install
    echo "Bonzomatic successfully installed."
  fi
  popd >/dev/null && popd >/dev/null && rm -rf ~/temp_deploy
else
    echo "Bonzomatic is already installed"
fi





