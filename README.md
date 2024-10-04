# 🚀 MATE Wayland Session

Wayland session using Wayfire for the MATE desktop

## 📦 Building MATE-WAYLAND-SESSION

You need Wayfire installed to run this session, as the startup script and configuration file are Wayfire-specific. Autotools or Meson will install the files in the correct places.

## 🔥 Wayfire Firedecor Plugin Recommended

It is recommended to install the Firedecor Wayfire plugin. This allows the use of a window decorator theme similar to the Menta Marco theme. If unavailable, the session will still work. The initial setup will not attempt to set a MATE-specific window decoration theme but will do everything else the same way.

## 📝 Notes on Install Directories for Firedecor Theme

To use the Menta style window control buttons instead of Firedecor's default buttons, ensure the data directory used in installing mate-wayland-session matches the one used by Firedecor. Here are some scenarios:

1. **Firedecor installed to `/usr`, mate-wayland-session installed to `/usr`**: Menta window buttons on first run.
   - Common when installed from distro packages.

2. **Firedecor installed to `/usr/local`, mate-wayland-session installed to `/usr/local`**: Menta window buttons on first run.
   - Common for local builds installed to `/usr/local`.

3. **Firedecor installed to `/usr`, mate-wayland-session installed to `/usr/local`**: Firedecor default window buttons used on first run.
   - To show Menta buttons, copy or symlink buttons from `/usr/local/firedecor/button-styles/mate/` to `/usr/firedecor/button-styles/mate/`.

4. **Firedecor installed to `/usr/local`, mate-wayland-session installed to `/usr`**: Firedecor default window buttons used on first run.
   - Copy or symlink buttons from `/usr/firedecor/button-styles/mate/` to `/usr/local/firedecor/button-styles/mate/`.

## 🐞 Reporting Bugs and Submitting Patches

Report new bugs on [GitHub](https://github.com/mate-desktop/mate-wayland-session). Please check for duplicates, especially for feature requests.

## 📋 Details of MATE-WAYLAND-SESSION

This is a simple and experimental MATE session using Wayfire, a Wayland compositor reimplementing much of the look and feel of Compiz.

- **Display Managers**: Tested and known to work under SDDM, should work with any Wayland-supporting display manager.
- **Session Launcher**: A script (`mate-wayland-components.sh`) launches MATE programs inside Wayfire. This session cannot run simultaneously with an X11 session using dbus on another TTY.
- **Startup Configuration**: Edit `~/.config/wayfire.ini` to add `mate-wayland-components.sh` and disable the default Wayfire shell.
- **Components**: Starts MATE components like Caja and Mate-panel without interfering with other parts of the user's Wayfire configuration.

### 🛠 Configuration

- **GSettings**: GNOME, not MATE, gsettings preferences apply for fonts and icon themes under Wayland. For XWayland apps, MATE settings are applied.
- **GTK Options**: Many options selectable in X11 are hardcoded in Wayland. For example, headerbars on dialogs clash with the MATE UI and can be fixed by installing [GTK 3 with gtk3-classic patches](https://github.com/lah7/gtk3-classic).

### 🔧 Setting Themes and Fonts

Use `dconf-editor` to reset the GTK theme, icon theme, and fonts in `org/gnome/desktop/interface`. Apply preferences under both MATE and GNOME to theme Wayland and XWayland apps consistently.

### 📑 GSettings Override

A gsettings override file sets the MATE icon theme and Menta GTK theme, and turns off overlay scrolling on a new or default install.

### 🎨 Window Decoration

Install the "Firedecor" plugin for a window decorator theme similar to the Menta Marco theme in X11. If not installed, Wayfire's default SSD decoration theme is used.

- **Future Development**: Another decorator under development can read Marco themes from [wf-external-decoration](https://github.com/marcof-nikogo/wf-external-decoration) and with a simpler system and more reliable functioning
but not rendering quite as well from [[wf-external-decoration](https://github.com/marcof-nikogo/metacity-decor)

- **Default to SSD for now**: Server-side decoration is preferred due to issues with CSD on MATE apps.

- **Default to CSD will be possible in the future**: Recent developments in caja fixed the window move/resize issue under CSD. Note that wayfire's CSD will follow the GTK theme's port of the metacity theme in all of the MATE themes and many others.

- **Preference for CSD can be set by user if using caja from git master**: Gives better decoration theming in some GTK themes but still requires the SSD theme to handle Xwayland windows

### XSettings Manager still used but only for Xwayland apps which otherwise follow GTK defaults

Wayland compositors control more of the session than X11 window managers. Wayfire in Wayland handles much of what Marco, mate-session-manager, and mate-settings-daemon do in X11. Non-wayland supporting apps such as GTK2 apps run under Xwayland, these still benefit from having a running xsettings manager itself under xwayland

## 📂 Wayfire Configuration Manager (WCM) Recommended

Wayfire Configuration Manager provides a GUI similar to CCSM for Compiz, allowing control over many options managed by the compositor in a Wayland session.

### Known issues

Do not set Application ID Mode in workarounds to anything other than it's default of "stock" as doing so will prevent mate-panel's window list from finding the application icons
