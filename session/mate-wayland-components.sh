#!/bin/sh
#Set up dbus

systemctl --user import-environment DISPLAY WAYLAND_DISPLAY
hash dbus-update-activation-environment 2>/dev/null && dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY

#Programs to restart while compositor is running, matching Xorg behavior

(pgrep "wayfire"
while true; do
mate-panel
pgrep "wayfire"
if [ $? -ne 0  ]; then
       break
fi
done) &

(pgrep "wayfire"
while true; do
/usr/libexec/polkit-mate-authentication-agent-1
pgrep "wayfire"
if [ $? -ne 0  ]; then
       break
fi
done) &

(pgrep "wayfire"
while  true; do
/usr/libexec/mate-notification-daemon
pgrep "wayfire"
if [ $? -ne 0  ]; then
       break
fi
done) &

(pgrep "wayfire"
while  true; do
caja -n --force-desktop
pgrep "wayfire"
if [ $? -ne 0  ]; then
       break
fi
done) &

#Programs to start once (if we have them), matching Xorg behavior
nm-applet --indicator &
cat /usr/bin/blueman-applet > /dev/null
if [ $? -eq 0  ]; then
    blueman-applet &
fi
cat /usr/bin/gnome-keyring-daemon > /dev/null
if [ $? -eq 0  ]; then
    gnome-keyring-daemon --start --components=pkcs11 &
    #Run the last process in the foreground to ensure a normal session exit
    gnome-keyring-daemon --start --components=ssh 
fi

