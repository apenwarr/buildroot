# FIXME: there should be a better way to rely on "basic setup" being done.
make syncconfig >&2
make dirs output/build/buildroot-config/auto.conf >&2
redo-ifchange output/build/buildroot-config/auto.conf
