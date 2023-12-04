#!/bin/sh
#add mate-wayland-components to [autostart] in wayfire.ini
#if not already there. Use the normal/user writable wayfire.ini location
#so WCM (wayfire configuration manager) can work

FIRSTRUN=$(grep "mate-wayland-components" /home/$USER/.config/wayfire.ini)

if [ $? -ne 0  ]; then
	echo "adding MATE components to wayfire's autostart .ini file"
	sed -i '/autostart]/a mate = mate-wayland-components.sh' /home/$USER/.config/wayfire.ini
fi

#Start the compositor
wayfire

#Clean up subshells on exit
killall sh
