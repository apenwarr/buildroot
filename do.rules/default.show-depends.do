. ./package.od

redo-always
exec make "$pkg-show-depends" ONE_PACKAGE_FILE="$makefile" >&2
