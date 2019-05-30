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

sudo apt install python-pip
pip install virtualenvwrapper
export WORKON_HOME=~/.virtual-envs
mkdir -p $WORKON_HOME
source /usr/local/bin/virtualenvwrapper.sh
