# mate-wayland-session
wayland session using wayfire for the MATE desktop
===

BUILDING MATE-WAYLAND-SESSION
===

You need wayfire installed to run this session, as the startup script and
configuration file are wayfire-specific.

Autotools will install the files in the correct places and can be used in the
usual way to build distribution packages


REPORTING BUGS AND SUBMITTING PATCHES
===
Report new bugs on https://github.com/mate-desktop/mate-wayland-session
Please check for duplicates, *especially* if you are reporting a feature
request.

DETAILS OF MATE-WAYLAND-SESSION
===

This is a simple and for now experimental MATE session using wayfire. Wayfire is a wayland compositor reimplementing much of the look and feel of compiz.

This has been tested and is known to work under SDDM, so it should work under any display manager that supports wayland. This session is shown in the greeter along with the MATE x11 session and all other installed sessions.

For now the session launcher is a script, and a second script (mate-wayland-components.sh) launches the mate programs inside wayfire.  We use the system message bus so this session cannot run simultaniously with an X11 session using dbus on another TTY. We can only launch anything running under wayland from inside the compositor and that is done by adding everything to be autostarted to ~/.config/wayfire.ini 
Note that several other compositors use a similar system. 

Therefore, at first startup find wayfire.ini if the user has copied it to their home directory, and find it in /usr/share/doc if it has not been installed in ~/config. Copy it to ~/.config/mate/wayfire.ini and edit it with sed to add mate-wayland-components.sh and disable starting the default wayfire shell by default. Once made, the session won't edit this file again, so the user can turn the default shell back on if they so desire.

This allows us to start mate-session components such as caja and mate-panel without interfering with any other part of a user's wayfire configuration and without breaking a wayland session run without MATE either. Wayfire-configuration-manager (WCM) will read from and write to the .ini file wayfire was opened with, so it will work.

Note that wayfire follows GNOME not MATE gsettings preferences for such things as fonts and icon themes. You can re-set these with dconf-editor for now, we need a fix for this in the future. A gsettings override file included with this package sets the MATE icon theme and Menta GTK theme and turns off overlay scrolling on a new or default install

Obviously we don't use an xsettings manager as we are not running under Xorg. Wayland compositors control a lot more of the session than X11 window managers do, wayfire thus does in wayland all of what marco would do in x11 plus some of what mate-session-manager mate-settings-daemon would do.
