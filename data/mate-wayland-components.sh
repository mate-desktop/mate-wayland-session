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

#Programs to start once, matching Xorg behavior
nm-applet --indicator

