SUBDIRS = \
	mate

firedecordir =  $(datadir)/doc/firedecor/
firedecor_DATA = firedecor.config

settingsdir =  $(datadir)/glib-2.0/schemas/
settings_DATA = 10_mate-wayland.gschema.override

install-data-hook:
if COMPILE_SCHEMAS
	glib-compile-schemas /usr/share/glib-2.0/schemas
endif

EXTRA_DIST = \
	meson.build

