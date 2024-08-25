#!/bin/bash

cleanup_display() {
	info=$(basename "$1" .so).info
	if [ ! -e "$info" ]; then
		return
	fi
	grep corename "$info" | sed -E 's/.*\"([^\"]+)\".*/\1/'
}
generate() {
	for file in *.so; do
		corename=$(cleanup_display "$file")
		echo "$file;$corename;"
		if [ -n "$corename" ]; then
			mkdir "OUTPUT/$corename" &>/dev/null
		fi
	done
}

cd ..
generate >OUTPUT/output.csv
cd -
