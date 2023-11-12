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

For now the session launcher is a script.  We use the system message bus so this session cannot run simultaniously with an X11 session using dbus on another TTY. Much of wayfire relies on wayfire.ini for configuration, so we install a MATE-specific wayfire.ini in /etc/mate and call wayfire with wayfire -c /etc/mate/wayfire.ini  so as to allow a standard wayfire session to coexist on the same system, selectable from the greeter.

Note that wayfire follows GNOME not MATE gsettings preferences for such things as fonts and icon themes. You can set these with dconf-editor for now, we need a fix for this in the future.

Obviously we don't use an xsettings manager as we are not running under Xorg. Wayland compositors control a lot more of the session than X11 window managers do, wayfire thus does in wayland all of what marco would do in x11 plus some of what mate-session-manager mate-settings-daemon would do.
