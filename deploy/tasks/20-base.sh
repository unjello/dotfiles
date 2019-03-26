#!/usr/bin/env bash

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