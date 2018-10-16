. ./package.od

# FIXME: auto-depend only on the necessary extractor packages
[ "$pkg" != 'host-lzip' -a "$pkg" != 'host-skeleton' ] &&
  redo-ifchange host-lzip

redo-ifchange "$2.source"
make "$pkg-extract" ONE_PACKAGE_FILE="$makefile" >&2
redo-ifchange output/build/$pkg*/.stamp_extracted
