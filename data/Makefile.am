SUBDIRS = \
	mate

firedecordir =  $(datadir)/doc/firedecor/
dist_firedecor_DATA = firedecor.config

settingsdir =  $(datadir)/glib-2.0/schemas/
dist_settings_DATA = 10_mate-wayland.gschema.override

configdir = /etc/gtk-3.0/
dist_config_DATA = settings.ini

install-data-hook:
	test -n "$(DESTDIR)" || glib-compile-schemas "$(settingsdir)"

EXTRA_DIST = \
	meson.build


-include $(top_srcdir)/git.mk
