desktopdir = $(datadir)/wayland-sessions

desktop_in_files = MATE.desktop.in
desktop_DATA = $(desktop_in_files:.desktop.in=.desktop)

%.desktop: %.desktop.in Makefile
	$(AM_V_GEN) $(MSGFMT) --desktop --template $< -d $(top_srcdir)/po -o $@

dist_bin_SCRIPTS = mate-wayland.sh mate-wayland-components.sh

EXTRA_DIST = \
	$(desktop_in_files) \
	meson.build

DISTCLEANFILES = \
	$(desktop_DATA) \
	$(NULL)
