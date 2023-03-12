#!/bin/bash

question=$(echo "󰜺 Cancel|󰌾 Lock|󰍃 Logout|󰜉 Reboot|󰐥 Shutdown" | \
	rofi -sep "|" -dmenu -i -p ' Power Menu')

case $question in
    *Cancel)
        exit 0
        ;;
    *Lock)
        betterlockscreen --time-format "%I:%M %p" -l dim
        ;;
    *Logout)
        i3-msg exit
        ;;
    *Reboot)
        systemctl reboot
        ;;
    *Shutdown)
        systemctl poweroff
        ;;
    *)
        exit 0  # do nothing on wrong response
        ;;
esac
