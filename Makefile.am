SUBDIRS = \
	data \
	po \
	session

ACLOCAL_AMFLAGS = -I m4 ${ACLOCAL_FLAGS}

EXTRA_DIST = \
	autogen.sh \
	meson.build \
	meson-postinstall.sh

DISTCLEANFILES = \
	aclocal.m4 \
	autom4te.cache/* \
	m4/* \
	intltool-*.in \
	libtool \
	ltmain.sh \
	omf.make \
	mkinstalldirs \
	xmldocs.make

MAINTAINERCLEANFILES = \
	$(srcdir)/aclocal.m4 \
	$(srcdir)/config.guess \
	$(srcdir)/config.sub \
	$(srcdir)/install-sh \
	$(srcdir)/missing \
	$(srcdir)/omf.make \
	$(srcdir)/xmldocs.make

# Build ChangeLog from GIT  history
ChangeLog:
	$(AM_V_GEN) if test -d $(top_srcdir)/.git; then \
		GIT_DIR="$(top_srcdir)/.git" git log --stat > $@; \
	fi

dist: ChangeLog

.PHONY: ChangeLog

-include $(top_srcdir)/git.mk
