#!/bin/sh

lock() {
    swaylock -e -f -c 000000 -i ~/Pictures/WP/3.jpg -t
}

case "$1" in
    lock)
        lock
        ;;
    logout)
        swaymsg exit
        ;;
    suspend)
        lock && systemctl suspend
        ;;
    hibernate)
        lock && systemctl hibernate
        ;;
    reboot)
        systemctl reboot
        ;;
    shutdown)
        shutdown -P now
        ;;
    *)
        echo "Usage: $0 {lock|logout|suspend|hibernate|reboot|shutdown}"
        exit 2
esac

exit 0
