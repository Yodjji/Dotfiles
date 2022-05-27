CLI_func()
{
    sudo pacman -S man man-db man-pages texinfo openssh networkmanager dhcp dhcpcd dhclient wget curl mesa xf86-video-amdgpu xorg xorg-xwayland lib32-mesa amd-ucode alsa-lib alsa-utils pulseaudio pavucontrol pipewire pipewire-alsa pipewire-media-session sudo vim youtube-dl bluez blueman blueberry udiskie grub efibootmgr
}


Graphic_func()
{
    sudo pacman -S nm-connection-editor network-manager-applet sway swaylock swayidle waybar wofi mako imv wl-clipboard slurp grim gsimplecal galculator sddm kitty htop bashtop ranger librewolf firefox discord telegram-desktop gnome-calculator thunar keepassxc snapd 
    cp /etc/sway/config ~/.config/sway/
}

main()
{
read -p "CLI or Graphic install? "  x
case $x in
    "c") CLI_func ;;
    "g") Graphic_func ;;
      *) echo "Not responde"
esac
}

main
