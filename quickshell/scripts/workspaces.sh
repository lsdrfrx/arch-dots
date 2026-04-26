if [[ "$1" == "occupied" ]]; then
  hyprctl workspaces -j | jq -r ".[] | select(.windows != 0) | .name" | jq -s
elif [[ "$1" == "set" ]]; then
  hyprctl dispatch workspace $(($2 + 1))
fi

