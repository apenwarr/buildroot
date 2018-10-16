# Find the .do file in do.rules to build any given target.
( cd do.rules && redo-whichdo "$1" ) | {
	ifcreate=
	while read dofile; do
		dopath="./do.rules/$dofile"
		if [ -e "$dopath" ]; then
			redo-ifcreate $ifcreate
			redo-ifchange "$dopath"
			suffix=
			[ "$dofile" != "${dofile#default.}" ] && suffix=${dofile#default}
			suffix=${suffix%.do}
			x2=${1%"$suffix"}
			set -- "$1" "$x2" "$3"
			. "$dopath"
			exit
		else
			ifcreate="$ifcreate $dopath"
		fi
	done
	echo "Fatal: no .do file found for $1" >&2
	exit 44
}
