#! /bin/bash

connect_func()
{
#scan devices
bluetoothctl --timeout 5 scan on

#find correct device
device_name=`bluetoothctl devices | cut -d' ' -f4`
headphones_name="AirDots_R"

#pair and connect correct device
for device in $device_name
do
    if [ "$device" == "$headphones_name" ]; then
        blut_headphones=`bluetoothctl devices | grep $device |cut -d' ' -f2`
        bluetoothctl pair $blut_headphones & bluetoothctl connect $blut_headphones
    fi
done
}

disconnect_func()
{
#find correct device
device_name=`bluetoothctl devices | cut -d' ' -f4`
headphones_name="AirDots_R"

#pair and connect correct device
for device in $device_name
do
    if [ "$device" == "$headphones_name" ]; then
        blut_headphones=`bluetoothctl devices | grep $device | cut -d' ' -f2`
        bluetoothctl disconnect $blut_headphones & bluetoothctl remove $blut_headphones
    fi
done
}

fix_func()
{    
    sudo systemctl restart bluetooth.service && sudo rfkill unblock bluetooth && sudo modprobe -r btusb; sudo modprobe -r btintel; sudo modprobe btusb; sudo modprobe btintel
}

main()
{
  read -p "Actions with bluetooth: connect (c), disconnect (d), fix problem (f) or fix problem and connect(fc)? "  x
case $x in
    "c") connect_func ;;
    "d") disconnect_func ;;
    "f") fix_func ;;
    "fc") fix_func && connect_func ;;
      *) echo "Not responde"
esac
}

main


