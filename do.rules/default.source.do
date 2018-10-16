. ./package.od

make "$pkg-source" ONE_PACKAGE_FILE="$makefile" >&2
redo-ifchange output/build/$pkg*/.stamp_downloaded
