#!/bin/bash

if [[ "$1" == "next" ]]; then
  hyprctl switchxkblayout -- --gaming-keyboard next
elif [[ "$1" == "get" ]]; then
  hyprctl devices -j |
  jq -r '.keyboards[] | select(.name == "--gaming-keyboard") | .active_keymap' |
  head -n1 |
  cut -c1-2
fi
