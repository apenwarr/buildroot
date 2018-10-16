redo-ifchange .config
make --no-print-directory show-targets |
  sed -e 's/\s/\n/g' >$3
redo-stamp <$3
cat $3 >&2
