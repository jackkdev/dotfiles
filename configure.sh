#!/bin/bash

set -e
shopt -s nullglob

root=$(pwd)
directories=(.config/*)

for directory in "${directories[@]}"; do
  rp=$(realpath "$directory")
  sp="$HOME/$directory"
  if [[ ! -e $sp ]]; then
    echo "+ Creating a symlink: $sp -> $rp"
    ln -s "$rp" "$sp"
  else
    echo "+ A symlink already exists for: $sp -> $rp"
  fi
done
