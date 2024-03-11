
AC_PREREQ(2.53)

AC_INIT([mate-wayland-session],
        [1.28.0],
        [https://github.com/mate-desktop/mate-wayland-session/issues],
        [mate-wayland-session],
        [https://mate-desktop.org])

AM_INIT_AUTOMAKE([1.11 no-dist-gzip dist-xz tar-ustar check-news])

# Enable silent build rules by default, requires at least
# Automake-1.11. Disable by either passing --disable-silent-rules to
# configure or passing V=1 to make
m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])

PKG_PROG_PKG_CONFIG([0.19])

# ****************************
AM_GNU_GETTEXT([external])
AM_GNU_GETTEXT_VERSION([0.19.8])
AM_GNU_GETTEXT_REQUIRE_VERSION([0.19.8])

GETTEXT_PACKAGE=mate-wayland-session
AC_SUBST([GETTEXT_PACKAGE])
AC_DEFINE_UNQUOTED([GETTEXT_PACKAGE],["$GETTEXT_PACKAGE"],[Gettext package])

AC_CONFIG_FILES([
Makefile
session/Makefile
data/Makefile
data/mate/Makefile
po/Makefile.in
])

AC_ARG_ENABLE([schemas_compile],
 [AS_HELP_STRING([--enable-schemas_compile=yes|no],
                 [Enable or disable recompiling schemas after installing the override file default is enabled, disable for distcheck or checkinstall etc])],
 [enable_schemas_compile="$enableval"],
 [enable_schemas_compile="yes"])

AM_CONDITIONAL(COMPILE_SCHEMAS, [test "x$enable_schemas_compile" = "xyes"])
AS_IF([test "x$enable_schemas_compile" = "xyes"],
      [AC_DEFINE([COMPILE_SCHEMAS], [1], [Enable recompiling gschemas])])

AC_OUTPUT

dnl ==========================================================================
echo "
	mate-wayland-session-$VERSION:

	Installation prefix: ${prefix}

	configuration successfully, now type make
"
