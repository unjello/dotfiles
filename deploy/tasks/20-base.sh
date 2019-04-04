#!/usr/bin/env bash
[[ -z "$CORE_INCLUDED" ]] && { echo "Do not run directly. Use deploy.sh or run.sh"; exit 1; }

if [[ "$(getOsFamily)" = "ubuntu" ]]; then
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