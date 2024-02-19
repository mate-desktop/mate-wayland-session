SUBDIRS = \
	data \
	po \
	session

ACLOCAL_AMFLAGS = -I m4 ${ACLOCAL_FLAGS}

DISTCHECK_CONFIGURE_FLAGS = \
--disable-schemas_compile

EXTRA_DIST = \
	autogen.sh \
	session \
	data \
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

# Build ChangeLog from GIT  history
ChangeLog:
	$(AM_V_GEN) if test -d $(top_srcdir)/.git; then \
		GIT_DIR="$(top_srcdir)/.git" git log --stat > $@; \
	fi

dist: ChangeLog

.PHONY: ChangeLog
