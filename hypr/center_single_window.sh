#!/usr/bin/env bash

TARGET_WORKSPACE="special:scratchpad"

WINDOW_WIDTH=1920
WINDOW_HEIGHT=1080

adjust_windows() {
  windows=$(hyprctl clients -j | jq -r ".[] | select(.workspace.name == \"$TARGET_WORKSPACE\") | .address")
  count=$(echo "$windows" | grep -v "^$" | wc -l)
  
  if [ "$count" -eq 1 ]; then
    window=$(echo "$windows" | head -1)
    
    is_floating=$(hyprctl clients -j | jq -r ".[] | select(.address == \"$window\") | .floating")
    if [ "$is_floating" != "true" ]; then
      hyprctl dispatch togglefloating "address:$window"
      # Small delay to ensure floating state is registered
      sleep 0.1
    fi
    
    hyprctl dispatch resizeactive "exact $WINDOW_WIDTH $WINDOW_HEIGHT"
    hyprctl dispatch centerwindow
  elif [ "$count" -gt 1 ]; then
    for window in $windows; do
      if [ "$(hyprctl clients -j | jq -r ".[] | select(.address == \"$window\") | .floating")" = "true" ]; then
        hyprctl dispatch togglefloating "address:$window"
      fi
    done
  fi
}

SOCKET_PATH="$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock"

if [ ! -e "$SOCKET_PATH" ]; then
  echo "Error: Cannot find Hyprland socket at $SOCKET_PATH"
  exit 1
fi

adjust_windows

socat -U - UNIX-CONNECT:"$SOCKET_PATH" | while read -r line; do
  if [[ "$line" == "openwindow"* ]] || [[ "$line" == "closewindow"* ]] || [[ "$line" == "movewindow"* ]]; then
    adjust_windows
  fi
done
