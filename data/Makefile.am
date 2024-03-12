SUBDIRS = \
	mate

firedecordir =  $(datadir)/doc/firedecor/
dist_firedecor_DATA = firedecor.config

settingsdir =  $(datadir)/glib-2.0/schemas/
dist_settings_DATA = 10_mate-wayland.gschema.override

install-data-hook:
	test -n "$(DESTDIR)" || glib-compile-schemas "$(settingsdir)"

EXTRA_DIST = \
	meson.build

