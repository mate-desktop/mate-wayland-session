#!/bin/sh

#make sure we can find anything normally installed in libexec even if installed elsewhere
export PATH="$PATH:/usr/local/libexec:/usr/libexec"

#Set up dbus

systemctl --user import-environment DISPLAY WAYLAND_DISPLAY
hash dbus-update-activation-environment 2>/dev/null && dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY

#Programs to restart while compositor is running, matching Xorg behavior

(pgrep "wayfire"
while true; do
mate-panel

if ! pgrep "wayfire" ; then
       break
fi
done) &

(pgrep "wayfire"
while true; do
polkit-mate-authentication-agent-1

if ! pgrep "wayfire" ; then
       break
fi
done) &

(pgrep "wayfire"
while  true; do
mate-notification-daemon

if ! pgrep "wayfire" ; then
       break
fi
done) &

(pgrep "wayfire"
while  true; do
GDK_BACKEND=x11 mate-settings-daemon

if ! pgrep "wayfire" ; then
       break
fi
done) &

(pgrep "wayfire"
while  true; do
caja -n --force-desktop

if ! pgrep "wayfire" ; then
       break
fi
done) &

#Programs to start once (if we have them), matching Xorg behavior
nm-applet --indicator &

if ! cat /usr/bin/blueman-applet > /dev/null ; then
    blueman-applet &
fi

if ! cat /usr/bin/gnome-keyring-daemon > /dev/null ; then
    gnome-keyring-daemon --start --components=pkcs11 &
    #Run the last process in the foreground to ensure a normal session exit
    gnome-keyring-daemon --start --components=ssh 
fi

