AC_PREREQ([2.69])
AC_INIT([cupertino-theme], [1.0], [admin@example.com])
AM_INIT_AUTOMAKE([foreign])

AC_PATH_PROG(GTK_UPDATE_ICON_CACHE, gtk-update-icon-cache)

# Fully expand datadir
test "x$prefix" = xNONE && prefix=$ac_default_prefix
test "x$exec_prefix" = xNONE && exec_prefix=$prefix

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
