#!/bin/bash

cd "$(dirname "$(realpath "$0")")/conf" || exit

file=$(fzf) || exit
ln -sf "conf/$file" ../setup

hyprctl reload
sleep 0.5

# Extract the last *enabled* monitor from the selected config
monitor_target=$(grep '^monitor = ' "$file" | grep -v 'disable' | tail -n 1 | cut -d',' -f1 | awk '{print $3}')

echo $monitor_target

# Move workspaces 1–5 to that monitor
for number in {1..5}; do
  hyprctl dispatch moveworkspacetomonitor "$number" "$monitor_target"
done
