#!/bin/bash

set -e
shopt -s nullglob

root=$(pwd)
directories=(.config/*)

for directory in "${directories[@]}"; do
  rp=$(realpath "${directory}")
  echo "+ Creating a symlink: ${HOME}/${directory} -> ${rp}"
  ln -s "${rp}" "${HOME}/${directory}"
done
