. ./package.od

redo-ifchange "$2.depends"
make "$pkg-configure" ONE_PACKAGE_FILE="$makefile" >&2
redo-ifchange output/build/$pkg*/.stamp_configured
