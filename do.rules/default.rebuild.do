. ./package.od

redo-always
redo-ifchange "$2.configure"
exec make "$pkg-rebuild" >&2
