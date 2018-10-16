. ./helpers.od

make _rootfs-common >&2
redo-ifchange all-install-stamps host-fakeroot
xargs redo-ifchange <all-install-stamps
