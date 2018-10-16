exec >&2
. ./helpers.od
redo-ifchange helpers.od

if contains "$1" "/"; then
    die "No .do file for '$1'"
fi

if startswith "$1" "rootfs-"; then
    pkg=${1#rootfs-}
    makefile=fs/$pkg/$pkg.mk
    [ -e "$makefile" ] || die "no buildroot package found: $makefile"
    exec redo-ifchange fs/$pkg.rootfs
fi

pbase=$(basename "$1")
p_x=$(echo "$pbase" | sed -e 's/-\(source\|extract\|patch\|depends\|configure\|build\|install\|show-depends\|show-rdepends\|show-recursive-depends\|show-recursive-rdepends\|graph-depends\|graph-rdepends\|dirclean\|reconfigure\|rebuild\)$/ \1/')
pkg=${p_x%% *}
suffix=${p_x#"$pkg"}
suffix=${suffix# }

# FIXME: reject host-* packages that don't define any host- build rules
host=
startswith "$pkg" "host-" && host=.host
pkg=${pkg#host-}

#echo "package='$pkg'  suffix='$suffix'" >&2
makefile=$(find package toolchain/toolchain*/ -name "$pkg.mk" -print)
[ -n "$makefile" ] || die "no buildroot package found: .../$pkg/$pkg.mk"
pkgdir=${makefile%/*}
#echo "makefile='$makefile' pkgdir='$pkgdir'" >&2

redo-ifchange syncconfig
[ "$suffix" != "" ] || suffix=install
if [ "$suffix" = install ]; then
    # These aren't necessary, but help reduce the level of recursion.
    # (Otherwise $pkg.install depends on .build, which depends on .configure,
    # etc, and the call tree is needlessly deep, which uglifies the logs.)
    redo-ifchange "$pkgdir$host.source"
    redo-ifchange "$pkgdir$host.extract"
    redo-ifchange "$pkgdir$host.patch"
    redo-ifchange "$pkgdir$host.depends"
    redo-ifchange "$pkgdir$host.configure"
    redo-ifchange "$pkgdir$host.build"
fi
exec redo-ifchange "$pkgdir$host.$suffix"
