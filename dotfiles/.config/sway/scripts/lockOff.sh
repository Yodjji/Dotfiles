#! /bin/bash

swayidle -w  \
    timeout 1 'swaylock -e -f -c 000000 -i /home/yodjj/Pictures/WP/12.png -t' \
    timeout 2 'swaymsg "output * dpms off"' \
    resume 'swaymsg "output * dpms on"; pkill -nx swayidle'
