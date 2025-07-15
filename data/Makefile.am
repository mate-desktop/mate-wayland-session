SUBDIRS = \
	mate

settingsdir =  $(datadir)/glib-2.0/schemas/
dist_settings_DATA = 10_mate-wayland.gschema.override

install-data-hook:
	test -n "$(DESTDIR)" || glib-compile-schemas "$(settingsdir)"

EXTRA_DIST = \
	meson.build


-include $(top_srcdir)/git.mk
