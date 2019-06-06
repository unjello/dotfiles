#!/usr/bin/env bash

function get_os_family {
  if [ -f /etc/os-release ]; then
    # freedesktop.org and systemd
    . /etc/os-release
    echo $(echo $ID_LIKE | cut -f1 -d' ' | tr '[:upper:]' '[:lower:]')
  else
    # Fall back to uname, e.g. "Linux <version>", also works for BSD, etc.
    echo $(uname -s)
  fi
}

os=$(get_os_family)
if [[ "$os" != "ubuntu" ]]; then
  echo "Ubuntu required"
  exit 1
fi

`hash pip`
if [[ $? -ge 1 ]]; then
  echo "Pip not found, installing."
  sudo apt install -y python-pip
else
  echo "Pip found".
fi

`hash virtualenvwrapper.sh`
if [[ $? -ge 1 ]]; then
  echo "VirtualEnvWrapper not found, installing."
  pip install --user -U virtualenvwrapper==4.8.4
  export WORKON_HOME=~/.virtual-envs
  mkdir -p $WORKON_HOME
else
  echo "VirtualEnvWrapper found."
fi

export VIRTUALENVWRAPPER_PYTHON=python3.6
source $HOME/.local/bin/virtualenvwrapper.sh 
`lsvirtualenv | grep ansible 2>&1 1>/dev/null`
if [[ $? -ge 1 ]]; then
  echo "Ansible virtual-env not found, configuring."
  mkvirtualenv ansible
  pip install -r <(cat <<REQUIREMENTS
virtualenvwrapper==4.8.4
ansible==2.8.0
REQUIREMENTS)
else
  echo "Ansible virtual-env found."
fi

sudo apt install -y git
mkdir -p ~/dotfiles
git clone https://github.com/unjello/dotfiles.git ~/dotfiles