# 🚀 MATE Wayland Session

Wayland session using Wayfire for the MATE desktop

## 📦 Building MATE-WAYLAND-SESSION

You need Wayfire installed to run this session, as the startup script and configuration file are Wayfire-specific. Autotools or Meson will install the files in the correct places.

## 🐞 Reporting Bugs and Submitting Patches

Report new bugs on [GitHub](https://github.com/mate-desktop/mate-wayland-session). Please check for duplicates, especially for feature requests.

## 📋 Details of MATE-WAYLAND-SESSION

This is a simple and experimental MATE session using Wayfire, a Wayland compositor reimplementing much of the look and feel of Compiz.

- **Display Managers**: Tested and known to work under SDDM, should work with any Wayland-supporting display manager.
- **Session Launcher**: A script (`mate-wayland-components.sh`) launches MATE programs inside Wayfire. This session cannot run simultaneously with an X11 session using dbus on another TTY.
- **Startup Configuration**: Edit `~/.config/wayfire.ini` to add `mate-wayland-components.sh` and disable the default Wayfire shell.
- **Components**: Starts MATE components like Caja and Mate-panel without interfering with other parts of any existing Wayfire configuration

### 🛠 Configuration

- **GSettings**: GNOME, not MATE, gsettings preferences apply for fonts and icon themes under Wayland. For XWayland apps, MATE settings are applied.
- **GTK Options**: Many options selectable in X11 are hardcoded in Wayland. For example, headerbars on dialogs clash with the MATE UI and can be fixed by installing [GTK 3 with gtk3-classic patches](https://github.com/lah7/gtk3-classic).

### 🔧 Setting Themes and Fonts

Use `dconf-editor` to reset the GTK theme, icon theme, and fonts in `org/gnome/desktop/interface`. Apply preferences under both MATE and GNOME to theme Wayland and XWayland apps consistently.

### 📑 GSettings Override

A gsettings override file sets the MATE icon theme and Menta GTK theme, and turns off overlay scrolling on a new or default install.

### 🎨 Window Decoration

We no longer replace wayfire's default CSD with SSD for native wayland windows as it looks
far better than the default decorator and follows marco themes as now defined in the GTK theme
quite well

The Wayfire Firedecor Plugin  is no longer supported upstream
The default decoration plugin is now used instead, but is only needed for xwayland windows

- **Future Development**: Another decorator under development can read Marco themes from [wf-external-decoration](https://github.com/marcof-nikogo/wf-external-decoration) and with a simpler system and more reliable functioning
but not rendering quite as well from (https://github.com/marcof-nikogo/metacity-decor)

### XSettings Manager still used but only for Xwayland apps which otherwise follow GTK defaults

Wayland compositors control more of the session than X11 window managers. Wayfire in Wayland handles much of what Marco, mate-session-manager, and mate-settings-daemon do in X11. Non-wayland supporting apps such as GTK2 apps run under Xwayland, these still benefit from having a running xsettings manager itself under xwayland

## 📂 Wayfire Configuration Manager (WCM) Recommended

Wayfire Configuration Manager provides a GUI similar to CCSM for Compiz, allowing control over many options managed by the compositor in a Wayland session.

### Known issues

Do not set Application ID Mode in workarounds to anything other than it's default of "stock" as doing so will prevent mate-panel's window list from finding the application icons
