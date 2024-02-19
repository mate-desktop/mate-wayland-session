desktopdir = $(datadir)/wayland-sessions

desktop_in_files = MATE.desktop.in
desktop_DATA = $(desktop_in_files:.desktop.in=.desktop)

%.desktop: %.desktop.in Makefile
	$(AM_V_GEN) $(MSGFMT) --desktop --template $< -d $(top_srcdir)/po -o $@

bin_SCRIPTS = mate-wayland.sh mate-wayland-components.sh

install-data-local:
	mkdir -p $(bindir)
	mkdir -p $(datadir)/wayland-sessions


EXTRA_DIST = \
	mate-wayland.sh \
	MATE.desktop \
	mate-wayland.sh \
	mate-wayland-components.sh \
	meson.build

DISTCLEANFILES = \
	$(desktop_DATA) \
	$(NULL)
