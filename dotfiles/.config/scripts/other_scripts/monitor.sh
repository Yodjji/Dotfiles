#! /bin/bash

INTERFACE=`ip a | grep wlp | awk -F: '{ print $2 }'`

mac_change () {
  read -r -p "Do you wish to change mac? (y/n/d (disable)): " answer
  echo

  if [[ -n "$INTERFACE" ]]; then
    if [[ "$answer" == "y" || "$answer" == "Y" ]]; then  
      ip link set $INTERFACE down
      macchanger -r $INTERFACE
      ip link set $INTERFACE up
    elif [[ "$answer" == "n" || "$answer" == "N" ]]; then
      macchanger -s $INTERFACE
    elif [[ "$answer" == "d" || "$answer" == "D" ]]; then
      ip link set $INTERFACE down
      macchanger -p $INTERFACE
      ip link set $INTERFACE up
    else
      echo "Wrong input!"
      exit 1
    fi
  else
    echo "INTERFACE not found!"
    exit 1
  fi
}

interface_mode_change () {
  echo
  read -r -p "Do you wish to enable monitor mode? (y/n/d (disable)): " answer

  if [[ -n "$INTERFACE" ]]; then
    if [[ "$answer" == "y" || "$answer" == "Y" ]]; then  
      ip link set $INTERFACE down
      iwconfig $INTERFACE mode monitor
      airmon-ng check kill
      ip link set $INTERFACE up
    elif [[ "$answer" == "n" || "$answer" == "N" ]]; then
      exit 0
    elif [[ "$answer" == "d" || "$answer" == "D" ]]; then
      ip link set $INTERFACE down
      iwconfig $INTERFACE mode managed
      ip link set $INTERFACE up
      systemctl restart NetworkManager
    else
      echo "Wrong input!"
      exit 1
    fi
  else
    echo "INTERFACE not found!"
    exit 1
  fi
}

main () {
  if [ "$EUID" -ne 0 ]; then
    echo "Run as root!"
    exit 1
  else
    mac_change
    interface_mode_change
    exit 0
  fi
}

main
