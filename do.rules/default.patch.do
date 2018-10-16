. ./package.od

redo-ifchange "$2.extract"
for d in $2/*.patch $2/*.diff; do
    [ -e "$d" ] || continue
    echo "patchfile: '$d'" >&2
    echo "$d"
done | xargs redo-ifchange
make "$pkg-patch" ONE_PACKAGE_FILE="$makefile" >&2
redo-ifchange output/build/$pkg*/.stamp_patched
