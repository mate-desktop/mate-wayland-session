SUBDIRS = \
	mate

desktopdir = $(datadir)/wayland-sessions

install-data-local:
	mkdir -p $(datadir)/wayland-sessions
	mkdir -p $(datadir)/doc/firedecor
	cp  10_mate-wayland.gschema.override $(datadir)/glib-2.0/schemas/10_mate-wayland.gschema.override
	cp  firedecor.config $(datadir)/doc/firedecor/firedecor.config

install-exec-local:
	glib-compile-schemas $(datadir)/glib-2.0/schemas

uninstall-local:
	rm $(datadir)/glib-2.0/schemas/10_mate-wayland.gschema.override
	rm $(datadir)/doc/firedecor/firedecor.config
	glib-compile-schemas $(datadir)/glib-2.0/schemas

