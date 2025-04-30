#!/usr/bin/env bash

entries="⇠ Suspend\n󰑙 Reboot\n⏻ Shutdown\n󰌾 Lock"

selected=$(echo -e $entries|wofi --dmenu --conf=/home/max/.config/wofi/powermenu.config --style=/home/max/.config/wofi/powermenu-style.css | awk '{print tolower($2)}')

case $selected in
  suspend)
    exec systemctl suspend;;
  reboot)
    exec systemctl reboot;;
  shutdown)
    exec systemctl poweroff;;
  lock)
    exec hyprlock;;
esac
