desktopdir = $(datadir)/wayland-sessions

install-data-local:
	mkdir -p $(bindir)
	mkdir -p $(datadir)/wayland-sessions
	cp  mate-wayland.sh $(bindir)/mate-wayland.sh
	cp  mate-wayland-components.sh $(bindir)/mate-wayland-components.sh
	cp  MATE.desktop $(datadir)/wayland-sessions/MATE.desktop

uninstall-local:

	rm  $(bindir)/mate-wayland.sh
	rm  $(bindir)/mate-wayland-components.sh
	rm  $(datadir)/wayland-sessions/MATE.desktop

