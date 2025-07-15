#!/bin/sh

#make sure we can find anything normally installed in libexec even if installed elsewhere
export PATH="$PATH:/usr/local/libexec:/usr/libexec"

# This is no longer needed on new installs as wayfire.ini now does this for us
# But run it if an existing ~/config/mate/mate-wayfire.ini file does not include it
if !(grep  dbus-update-activation-environment /home/$USER/.config/mate/wayfire.ini); then 
#Set up dbus
dbus-update-activation-environment --systemd WAYLAND_DISPLAY DISPLAY XAUTHORITY ;
fi

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
export XDG_CURRENT_DESKTOP="MATE"
while  true; do
caja -n

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

