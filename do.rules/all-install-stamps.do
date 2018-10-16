redo-always
for d in output/build/*/.stamp_target_installed; do
    [ -e "$d" ] && echo "$d"
done >$3
redo-stamp <$3

