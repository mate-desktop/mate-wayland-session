#Set up dbus

systemctl --user import-environment DISPLAY WAYLAND_DISPLAY
hash dbus-update-activation-environment 2>/dev/null && dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY

#Programs to restart while compositor is running, matching Xorg behavior


(while true; do
mate-panel
done) &

(while true; do
/usr/libexec/polkit-mate-authentication-agent-1
done) &

(while true; do
/usr/libexec/mate-notification-daemon
done) &

(while true; do
caja -n --force-desktop
done) &

#Programs to start once, matching Xorg behavior
nm-applet --indicator &

