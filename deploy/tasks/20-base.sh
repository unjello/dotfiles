#!/usr/bin/env bash

[[ $(declare -f getOsFamily) ]] && . 00-detect-os.sh

if [[ getOsFamily -eq "elementary" ]]; then
  sudo apt -y install python3-pip python3-dev
  sudo ln -s /usr/bin/pip3 /usr/local/bin/pip
fi

pip_packages=(yq virtualenv virtualenvwrapper)

for i in "${pip_packages[@]}"; do 
  pip list 1>/dev/null 2>&1 | grep -F $i
  if [[ $? -ge 1 ]]; then
    pip install --user --upgrade "$i"; 
    if [[ $? -ge 1 ]]; then
      echo "There was a problem with installing $i..."
    fi
  fi
done