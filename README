# mate-wayland-session
wayland session using wayfire for the MATE desktop
===

BUILDING MATE-WAYLAND-SESSION
===

You need wayfire installed to run this session, as the startup script and
configuration file are wayfire-specific.

Autotools will install the files in the correct places and can be used in the
usual way to build distribution packages

WAYFIRE FIREDECOR PLUGIN RECOMMENDED
===

It is recommended that the firedecor wayfire plugin be installed, as this
allows use of a window decorator theme similar to the Menta marco theme. If
this is not available however the session will still work, the first run
setup code wil not attempt to set a MATE specific window decoration
theme but do everything else the same way;

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

Note that wayfire follows GNOME not MATE gsettings preferences for such things as fonts and icon themes. You can re-set these with dconf-editor for now, we need a fix for this in the future. A gsettings override file included with this package sets the MATE icon theme and Menta GTK theme and turns off overlay scrolling on a new or default install.

As stated above, we recommend that wayfire's "firedecor" plugin be installed. This is a window decorator plugin with more features that the default SSD decorator, including the ability to theme the window control buttons and change the font color. Both of these are necessary to allow setting a default window decorator theme similar to the Menta marco theme in x11. If the firedecor plugin is not installed, this code is simply ignored and the window decoration defaults to wayfire's default ssd decoration theme.

The session defaults to SSD (server-side decoration) rather than wayfire's default of CSD (client-side decoration) due to several issues with using CSD on MATE apps. If CSD is selected by the user, the window decorator theme set in the GTK theme for CSD apps is applied and will often be a good match for the marco theme (since we don't use headerbars in MATE), but caja navigation windows become difficult to move (cannot be dragged by the titlebar and require the keyboard "super" key amd left mouse button to move or the keyboard "super" key amd right mouse button to resize. On top of that, some windows such as mate-terminal get geometry issues. Thus we default to the traditional server-side decoration and windows work normally.

Obviously we don't use an xsettings manager as we are not running under Xorg. Wayland compositors control a lot more of the session than X11 window managers do, wayfire thus does in wayland all of what marco would do in x11 plus some of what mate-session-manager mate-settings-daemon would do.
