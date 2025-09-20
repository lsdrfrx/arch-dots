#!/bin/bash

fifo="/tmp/volume_fifo"
[ -p "$fifo" ] || mkfifo "$fifo"

get () {
  pamixer --get-volume
}

if [ "$1" == "up" ]; then
  volume=$(echo "$(get)+5" | bc)

  if (( "$volume" <= 100 )); then
    pamixer --set-volume "$volume"
  fi

elif [ "$1" == "down" ]; then
  volume=$(echo "$(get)-5" | bc)
  echo "$volume"

  if (( "$volume" >= 0 )); then
    pamixer --set-volume "$volume"
  fi

fi

echo "$(get)" > $fifo
