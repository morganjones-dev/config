#!/bin/sh

function handle() {
  hyprctl activewindow -j | jq --raw-output .title  | sed 's/\(.\{100\}\).*/\1.../'
}

handle

socat -u UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | while read -r line; do
  if [[ "$line" == "activewindow>>"* ]]; then
    handle
  fi
done
