. ./helpers.od

redo-ifchange show-targets syncconfig
{
    packages= roots=
    while read target; do
        if startswith "$target" "rootfs-"; then
            roots="$roots $target"
        else
            packages="$packages $target"
        fi
    done
} <show-targets

redo-ifchange $packages
redo-ifchange $roots
