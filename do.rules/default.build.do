. ./package.od

redo-ifchange "$2.configure"
make "$pkg-build" ONE_PACKAGE_FILE="$makefile" >&2
redo-ifchange output/build/$pkg*/.stamp_built
