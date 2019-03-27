#!/usr/bin/env bash
# based on: https://unix.stackexchange.com/a/6348

function getOsFamily {
  if [ -f /etc/os-release ]; then
    # freedesktop.org and systemd
    . /etc/os-release
    echo $(echo $ID | tr '[:upper:]' '[:lower:]')
  elif type lsb_release >/dev/null 2>&1; then
    # linuxbase.org
    echo $(lsb_release -si | tr '[:upper:]' '[:lower:]')
  else
    # Fall back to uname, e.g. "Linux <version>", also works for BSD, etc.
    echo $(uname -s)
  fi
}
