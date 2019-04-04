#!/usr/bin/env bash
if ((BASH_VERSINFO[0] < 4)); then
  echo "Sorry, you need at least bash-4.0 to run this script."
  exit 1
fi

task_file="tasks/$1.sh"
[[ ! -f $task_file ]] && {
  echo "Task file NOT found: $task_file"
  exit 1
}

shopt -s globstar

for f in core/**.sh; do source $f; done
source $task_file
