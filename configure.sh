#!/bin/bash

set -e
shopt -s nullglob

directories=(.config/*)
others=(".zshrc" ".alacritty.yml" ".Xresources")

paths=(${directories[@]} ${others[@]})
for path in "${paths[@]}"; do
  rp=$(realpath "$path")
  sp="$HOME/$path"
  if [[ ! -e "$sp" ]]; then
    echo "+ Creating a symlink: $sp -> $rp"
    ln -s "$rp" "$sp"
  else
    echo "+ A symlink already exists for: $sp -> $rp"
  fi
done

