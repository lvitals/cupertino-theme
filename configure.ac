AC_PREREQ([2.69])
AC_INIT([cupertino-theme], [1.0], [admin@example.com])
AM_INIT_AUTOMAKE([foreign])

AC_PATH_PROG(GTK_UPDATE_ICON_CACHE, gtk-update-icon-cache)

# Fully expand datadir
test "x$prefix" = xNONE && prefix=$ac_default_prefix
test "x$exec_prefix" = xNONE && exec_prefix=$prefix

# Logo option
AC_ARG_WITH([menu-logo],
  [AS_HELP_STRING([--with-menu-logo=LOGO], [Start menu logo to use (apple, mate, distro, arch, debian, fedora, ubuntu, etc.) [default=mate]])],
  [MENU_LOGO=$withval],
  [MENU_LOGO=mate]
)

if test "x$MENU_LOGO" = "xdistro"; then
    if test -f /etc/os-release; then
        MENU_LOGO=`grep '^ID=' /etc/os-release | cut -d= -f2 | tr -d '"'`
    else
        MENU_LOGO=apple
    fi
fi
AC_SUBST(MENU_LOGO)

# Robust expansion of datadir
full_datadir=$datadir
for i in 1 2 3; do
    full_datadir=`eval echo $full_datadir`
done
AC_SUBST(full_datadir)

AC_CONFIG_FILES([
    Makefile
    fonts/Makefile
    icons/Makefile
    themes/Makefile
    themes/Cupertino-Dark/index.theme
    themes/Cupertino-Dark-solid/index.theme
    themes/Cupertino-Light/index.theme
    themes/Cupertino-Light-solid/index.theme
    wallpapers/Makefile
    wallpapers/cupertino-wallpaper.xml
    other/Makefile
])
AC_OUTPUT
