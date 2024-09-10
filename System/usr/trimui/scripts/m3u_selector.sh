if [ "${1##*.}" = "m3u" ]; then
	selected="$(xargs -d "\n" /mnt/SDCARD/System/bin/selector <"$1")"
  rompath="$(dirname "$1")"
	set "$rompath/${selected#*: }" "${@:2}"
fi
