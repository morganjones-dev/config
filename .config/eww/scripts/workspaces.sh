#!/bin/bash

# spaces (){
# 	non_empty=`hyprctl workspaces -j | jq 'map({id: .id | tostring, windows: .windows}) | sort_by(.id)'`
#   highest_non_empty=`echo "$non_empty" | jq 'map(.id) | max'`
#   if [[ "$highest_non_empty" -lt 5 ]]; then
#     highest_non_empty="5"
#   fi

#   # seq 1 "$highest_non_empty" | jq --argjson "${nonempty}" -Mc --slurp "$non_empty" 'map({ id: .})'

#   seq 1 "$highest_non_empty" | jq --argjson windows "${non_empty}" --slurp -Mc 'map(tostring) | map({id: ., windows: ($windows[.]//0)})'
# }

function get_active() {
  hyprctl monitors -j | jq '.[0].activeWorkspace.id | tostring' --raw-output
}

function handle() {
  active=`get_active`
	non_empty=$(hyprctl workspaces -j | jq --raw-output 'map({key: .id | tostring, value: .windows}) | from_entries')
  highest_non_empty=`jq --raw-output 'to_entries | map(.key) | reverse | .[0] | tonumber' <<< "$non_empty"`
  
  if [[ "$highest_non_empty" -lt 5 ]]; then
    highest_non_empty="5"
  fi

	seq 1 "$highest_non_empty" | jq --argjson windows "${non_empty}" --slurp -Mc "map(tostring) | map({id: ., active: $active, windows: (\$windows[.]//0)})"
}

handle

socat -u UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | while read -r line; do
  if [[ "$line" = *"workspace>>"* ]]; then
	  handle
  fi
done