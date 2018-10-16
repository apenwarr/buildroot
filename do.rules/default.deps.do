. ./package.od

redo-ifchange "$makefile"
make  --no-print-directory "$pkg-show-depends" ONE_PACKAGE_FILE=$makefile |
  sed -e 's/\s/\n/g' >$3
cat "$3" >&2
