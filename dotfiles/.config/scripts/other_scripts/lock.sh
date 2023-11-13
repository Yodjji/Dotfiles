swayidle -w \
	timeout 1800 'swaylock -e -f -k -l -i ~/Pictures/WP/2K/3.jpg -t' \
	timeout 1805 'swaymsg "output * power off"' \
	resume 'swaymsg "output * power on"'
