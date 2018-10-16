. ./package.od

redo-ifchange "$2.build"
make "$pkg" ONE_PACKAGE_FILE="$makefile" >&2
if [ -n "$host" ]; then
    redo-ifchange output/build/$pkg*/.stamp_host_installed
else
    redo-ifchange output/build/$pkg*/.stamp_target_installed
fi