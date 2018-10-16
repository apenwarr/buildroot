. ./package.od

redo-always
redo-ifchange "$2.depends"
exec make "$pkg-reconfigure" >&2
