#!/bin/bash

#make sure we can find anything normally installed in libexec even if installed elsewhere
export PATH="$PATH:/usr/local/libexec:/usr/libexec"

# This is no longer needed on new installs as wayfire.ini now does this for us
# But run it if an existing ~/config/mate/mate-wayfire.ini file does not include it
if ! grep -q dbus-update-activation-environment "$HOME/.config/mate/wayfire.ini" 2>/dev/null; then
#Set up dbus
dbus-update-activation-environment --systemd WAYLAND_DISPLAY DISPLAY XAUTHORITY ;
fi

#Restart a program in a loop while wayfire is running, matching Xorg session behavior
restart_while_running() {
    while true; do
        "$@"
        pgrep "wayfire" > /dev/null || break
    done
}

#Programs to restart while compositor is running, matching Xorg behavior
restart_while_running mate-panel &
restart_while_running polkit-mate-authentication-agent-1 &
restart_while_running mate-notification-daemon &
restart_while_running env GDK_BACKEND=x11 mate-settings-daemon &
restart_while_running caja -n &

#Programs to start once (if we have them), matching Xorg behavior
nm-applet --indicator &

if command -v blueman-applet > /dev/null 2>&1 ; then
    blueman-applet &
fi

if command -v gnome-keyring-daemon > /dev/null 2>&1 ; then
    gnome-keyring-daemon --start --components=pkcs11 &
    #Run the last process in the foreground to ensure a normal session exit
    gnome-keyring-daemon --start --components=ssh
fi
