#!/usr/bin/env bash
if ((BASH_VERSINFO[0] < 4)); then
  echo "Sorry, you need at least bash-4.0 to run this script."
  exit 1
fi

shopt -s globstar

for f in tasks/**.sh; do source $f; done

echo $(getOsFamily)