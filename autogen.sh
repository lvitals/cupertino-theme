#!/bin/sh
set -e
aclocal
automake --add-missing --copy --foreign
autoconf
