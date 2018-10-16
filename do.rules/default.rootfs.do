. ./package.od

redo-ifchange rootfs-common
redo-ifchange all-install-stamps
xargs redo-ifchange <all-install-stamps
make "rootfs-$pkg" ONE_PACKAGE_FILE="$makefile" >&2
